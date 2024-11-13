import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassBookedScreenDetail extends StatelessWidget {
  const ClassBookedScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Format tanggal dengan intl
    DateTime classDate = DateTime(2024, 10, 16); // Misalnya tanggal kelas
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(classDate);

    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar dengan tombol back di pojok kiri atas
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/karate.jpg'),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('Karate', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Coach', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('Leonard', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start Time', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('17:00', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('End Time', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('19:00', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Room', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('Ruangan A', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
                Text('Rp20.000', style: TextStyle(fontSize: 16,color: Color(0xFF697684),fontWeight: FontWeight.w600)),
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
            const Text(
              'Join us for a fun and engaging Karate class with Coach Leonard. This class is suitable for all levels, from beginners to advanced students. It focuses on building strength, flexibility, and discipline through a variety of Karate techniques.',
              style: TextStyle(fontSize: 16,color: Color(0xFF697684)),
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