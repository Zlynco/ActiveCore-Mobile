import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://192.168.100.98/gymactivecore/public/api'; // Ganti dengan URL API Anda
    final Logger logger = Logger();

// Fungsi login yang mengembalikan token
Future<Map<String, dynamic>?> login(String name, String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Login berhasil, parse response untuk mendapatkan token
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String token = data['token']; // Ganti sesuai dengan nama key di response API

      // Simpan token di SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      return data; // Mengembalikan data pengguna termasuk token
    } else {
      return null; // Login gagal
    }
  } catch (e) {
    logger.d('Terjadi kesalahan saat login: $e');
    return null;
  }
}

  Future<bool> register(String name, String email, String phoneNumber, String passwordConfirmation, String password, String role) async {
  final response = await http.post(
    Uri.parse('$baseUrl/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'role': role, // Tambahkan role ke body
    }),
  );

  if (response.statusCode == 201) {
    // Registrasi berhasil
    return true;
  } else {
    // Registrasi gagal
    return false;
  }
}

}
