import 'dart:convert';
import 'package:active_core/models/coachbooking.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class CoachService {
  final String baseUrl = 'http://192.168.82.26/gymactivecore/public/api'; // Ganti dengan URL API Anda
  final Logger logger = Logger();

  // Fungsi untuk mengambil kelas dari API
  Future<List<dynamic>?> getClasses() async {
    try {
      // Ambil token dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('auth_token');

      if (token == null) {
        logger.d('Token tidak ditemukan');
        return null;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/getclass'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Menambahkan token ke header
        },
      );

      if (response.statusCode == 200) {
        // Kelas berhasil diambil, parse response
        final List<dynamic> classes = jsonDecode(response.body);
        return classes; // Mengembalikan list kelas
      } else {
        logger.d('Gagal mengambil kelas: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.d('Error occurred while fetching classes: $e');
      return null; // Kembalikan null jika terjadi kesalahan
    }
  }

    // Fungsi untuk mendapatkan data booking coach
  Future<List<CoachBooking>?> getCoachBookings() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('auth_token');

      if (token == null) {
        logger.i('Token tidak ditemukan');
        return null;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/getcoachbookings'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Menambahkan token ke header
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> bookingsJson = jsonDecode(response.body);

        // Mengonversi JSON menjadi list of CoachBooking
        List<CoachBooking> bookings = bookingsJson
            .map((booking) => CoachBooking.fromJson(booking))
            .toList();

        return bookings;
      } else {
        logger.i('Gagal mengambil booking coach: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.i('Terjadi kesalahan: $e');
      return null;
    }
  }

}
