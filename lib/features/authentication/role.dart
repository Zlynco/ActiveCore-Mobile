import 'package:active_core/features/authentication/AuthCoach/login.dart';
import 'package:active_core/features/authentication/AuthMember/login.dart';
import 'package:flutter/material.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF697684), // Warna atas
              Colors.white, // Warna bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Kolom untuk menampung tombol
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tombol pertama
                  Container(
                    width: 200, // Lebar tombol
                    height: 150, // Tinggi tombol
                    margin: const EdgeInsets.symmetric(vertical: 4.0), // Jarak antar tombol
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi saat tombol ditekan
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreenMember(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Warna latar belakang tombol
                        elevation: 0, // Menghilangkan bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Menggunakan gambar dari assets
                          Image.asset(
                            'assets/icons/teamwork.png',
                            width: 50, // Sesuaikan ukuran gambar
                            height: 50, // Sesuaikan ukuran gambar
                          ),
                          const SizedBox(width: 12), // Jarak antara ikon dan teks
                          const Text(
                            'As Member',
                            style: TextStyle(
                              color: Colors.black, // Warna teks
                              fontSize: 16, // Ukuran font
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Tombol kedua
                  Container(
                    width: 200, // Lebar tombol
                    height: 150, // Tinggi tombol
                    margin: const EdgeInsets.symmetric(vertical: 10.0), // Jarak antar tombol
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi saat tombol ditekan
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreenCoach(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Warna latar belakang tombol
                        elevation: 0, // Menghilangkan bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Menggunakan gambar dari assets
                          Image.asset(
                            'assets/icons/coach (1).png',
                            width: 50, // Sesuaikan ukuran gambar
                            height: 50, // Sesuaikan ukuran gambar
                          ),
                          const SizedBox(width: 12), // Jarak antara ikon dan teks
                          const Text(
                            'As Coach',
                            style: TextStyle(
                              color: Colors.black, // Warna teks
                              fontSize: 16, // Ukuran font
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}