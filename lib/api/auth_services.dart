import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.100.98/gymactivecore/public/api'; // Ganti dengan URL API Anda

  Future<Map<String, dynamic>?> login(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Login berhasil, parse response
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data; // Mengembalikan data pengguna termasuk role
    } else {
      // Login gagal
      return null; // Kembalikan null jika login gagal
    }
  }

  Future<bool> register(String name, String email, String phoneNumber, String passwordconfirmation,String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'phone_number': phoneNumber,'password': password, 'password_confirmation': passwordconfirmation}),
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
