import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:active_core/models/classes.dart';

class ClassService {
  final String baseUrl =
      'http://192.168.100.98/gymactivecore/public/api'; // Ganti dengan URL API Anda

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

  /// Get a single class by ID
  // Future<Classes> fetchClassById(int id) async {
  //   try {
  //     final response = await http.get(Uri.parse('$baseUrl/classes/$id'));
//
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonData = json.decode(response.body);
  //       return Classes.fromJson(jsonData);
  //     } else {
  //       throw Exception('Failed to load class');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching class: $e');
  //   }
  // }
}
