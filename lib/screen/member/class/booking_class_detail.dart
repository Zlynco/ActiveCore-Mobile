import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassBookingScreenDetail extends StatelessWidget {
  const ClassBookingScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Format tanggal dengan intl
    DateTime classDate = DateTime(2024, 10, 16); // Misalnya tanggal kelas
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(classDate);

    // Jumlah kuota yang tersedia
    int availableQuota = 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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
                              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                                  color: Color(0xFF697684)),
                              onPressed: () {
                                Navigator.pop(
                                    context); // Kembali ke halaman sebelumnya
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
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF697684)),
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
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor massa eu elit hendrerit volutpat. Fusce non semper felis.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF697684),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Start Time: 08:00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'End Time: 10:00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Room: Ruangan Z',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Price: Rp20.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Kuota Available dengan kotak warna
                    Row(
                      children: [
                        const Text(
                          'Kuota Available: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF697684),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color:
                                availableQuota > 0 ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            availableQuota > 0
                                ? '$availableQuota'
                                : 'Full', // Tampilkan "Full" jika kuota 0
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            // Tombol Book Now di bagian bawah
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: availableQuota > 0
                      ? () {}
                      : null, // Disable button when quota is 0
                  style: ElevatedButton.styleFrom(
                    backgroundColor: availableQuota > 0
                        ? const Color.fromARGB(
                            255, 0, 123, 255) // Warna tombol normal
                        : const Color(
                            0xFF697684), // Warna tombol ketika kuota 0 (Full)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(400, 55),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  child: Text(
                    availableQuota > 0
                        ? 'Book Now'
                        : 'Class Full', // Teks tombol tergantung kuota
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
