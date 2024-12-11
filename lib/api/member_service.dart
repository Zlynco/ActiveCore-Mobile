import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:active_core/models/classes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassService {
  final String baseUrl =
      'http://192.168.82.26/gymactivecore/public/api'; // Ganti dengan URL API Anda

  /// Get list of classes
  Future<List<Classes>> fetchClasses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/classes'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> jsonData = jsonResponse['data'];
        return jsonData.map((data) => Classes.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load classes');
      }
    } catch (e) {
      throw Exception('Error fetching classes: $e');
    }
  }

  /// Get popular category
  Future<List<dynamic>> fetchPopularCategory(int month) async {
    try {
      // Kirim permintaan GET ke API dengan query parameter `month`
      final response = await http.get(Uri.parse('$baseUrl/popularcategory?month=$month'));

      if (response.statusCode == 200) {
        // Parsing data JSON
        final data = json.decode(response.body);
        return data; // Mengembalikan daftar category populer
      } else {
        throw Exception('Failed to load popular category');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  /// Book a class
 Future<Map<String, dynamic>> bookClass(int classId) async {
  final url = Uri.parse('$baseUrl/booking');

  try {
    // Ambil token dari Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    // Lakukan permintaan POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'class_id': classId}),
    );

    if (response.statusCode == 201) {
      // Booking berhasil
      final data = json.decode(response.body);
      return {
        'success': true,
        'message': data['message'],
        'booking': data['booking'],
      };
    } else {
      // Booking gagal
      final errorData = json.decode(response.body);
      return {
        'success': false,
        'message': errorData['message'],
      };
    }
  } catch (e) {
    throw Exception('Error booking class: $e');
  }
}

}
