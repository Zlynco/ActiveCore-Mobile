import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ClassService {
  final String baseUrl = 'http://192.168.100.98/gymactivecore/public/api'; // Ganti dengan URL API Anda
    final Logger logger = Logger();

  // Fungsi untuk mengambil kelas dari API
  Future<List<dynamic>?> getClasses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/getclass'));

      if (response.statusCode == 200) {
        // Kelas berhasil diambil, parse response
        final List<dynamic> classes = jsonDecode(response.body);
        return classes; // Mengembalikan list kelas
      } else {
        // Gagal mengambil kelas
        return null; // Kembalikan null jika gagal
      }
    } catch (e) {
      logger.d('Error occurred while fetching classes: $e');
      return null; // Kembalikan null jika terjadi kesalahan
    }
  }
}
