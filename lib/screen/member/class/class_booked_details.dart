import 'package:active_core/models/classes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassBookedScreenDetail extends StatelessWidget {
  final Classes classItem;
  const ClassBookedScreenDetail({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    
    // Format tanggal dengan intl
String formattedDate =
        DateFormat('EEEE, d MMMM yyyy').format(classItem.date);
     final imageUrl = _getCategoryImage(classItem.category);

    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 45, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar dengan tombol back di pojok kiri atas
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF697684)),
                      onPressed: () {
                        Navigator.pop(context); // Kembali ke halaman sebelumnya
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Judul detail kelas
            const Text(
              'Detail Class',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 8),

            // Hari dan tanggal
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 16, color: Color(0xFF697684)),
            ),
            const SizedBox(height: 8),

            // Garis pemisah
            const Divider(),
            const SizedBox(height: 12),

            // Kategori, Coach, Start time, End time, Room, Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Category', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text(classItem.category, style: const TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Coach', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text(classItem.coach, style: const TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Start Time', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text(DateFormat('HH:mm').format(classItem.startTime), style: const TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('End Time', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text(DateFormat('HH:mm').format(classItem.endTime), style: const TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Room', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text(classItem.room, style: const TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Price', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('Rp${classItem.price}', style: const TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 12),

            // Garis pemisah
            const Divider(),
            const SizedBox(height: 8),

            // Deskripsi
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 8),

            // Deskripsi kelas
            Text(
              classItem.description,
              style: const TextStyle(fontSize: 16,color: Color(0xFF697684)),
            ),
            const SizedBox(height: 16),

            // Tombol Show QR Code
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol ditekan
                // Misalnya menampilkan QR Code
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('QR Code'),
                      content: const Text('QR Code for this class will be shown here.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
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
                'SHOW QR CODE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        
      ),
    );
    
  }
}
String _getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'boxing':
        return 'assets/images/boxing.jpg';
      case 'karate':
        return 'assets/images/karate.jpg';
      case 'yoga':
        return 'assets/images/yoga.jpg';
      case 'zumba':
        return 'assets/images/zumba.jpg';
      case 'muay thai':
        return 'assets/images/muaythai.jpg';
      default:
        return 'assets/images/default_class.jpg'; // Gambar default jika kategori tidak ditemukan
    }
  }