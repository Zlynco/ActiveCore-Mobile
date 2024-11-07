import 'package:flutter/material.dart';
import 'package:active_core/models/getclass.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

class DetailClassCoach extends StatelessWidget {
  final ClassModel classModel;
  final String classImageUrl;
  final logger = Logger();

  DetailClassCoach({
    super.key,
    required this.classModel,
    required this.classImageUrl,
  });

  String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('EEEE, dd MMM yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Class'),
      ),
      backgroundColor: const Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(classImageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              classModel.name, // Menggunakan classModel yang diterima
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formatDate(classModel.date), // Menampilkan tanggal kelas
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              classModel.description, // Menggunakan description dari classModel
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Start Time:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF697684),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  formatTime(classModel
                      .startTime), // Menggunakan startTime dari classModel
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF697684),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'End Time:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF697684),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  formatTime(classModel
                      .endTime), // Menggunakan endTime dari classModel
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF697684),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Room:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF697684),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  classModel.room, // Menggunakan room dari classModel
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF697684),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Price:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF697684),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Rp${classModel.price}', // Menggunakan price dari classModel
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF697684),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Member Terdaftar:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF697684),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${classModel.registeredCount}) members', // Menampilkan jumlah anggota dengan kurung
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF697684),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  logger.d("Scan button clicked!");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 123, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size(400, 55),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  'Scan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
