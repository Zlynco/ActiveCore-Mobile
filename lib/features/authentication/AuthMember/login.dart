import 'package:active_core/features/authentication/AuthMember/register.dart';
import 'package:active_core/home_screen.dart';
import 'package:active_core/widget/passwordfield.dart';
import 'package:flutter/material.dart';

class LoginScreenMember extends StatelessWidget {
  const LoginScreenMember({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/ActiveCore_icon.png',
                  width: 100, // Sesuaikan ukuran logo
                  height: 100, // Sesuaikan ukuran logo
                ),
                const SizedBox(height: 10), // Jarak antara logo dan teks
                // Judul
                const Text(
                  'Sign in to your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8), // Jarak antara judul dan subjudul
                const Text(
                  'Enter your credentials below',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40), // Jarak sebelum form
                // Form
                Container(
                  height: 480,
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna latar belakang form
                    borderRadius:
                        BorderRadius.circular(8.0), // Sudut melengkung
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.2), // Mengatur warna bayangan
                        offset: const Offset(0, 4), // Posisi bayangan
                        blurRadius: 8, // Seberapa kabur bayangan
                        spreadRadius: 4, // Seberapa jauh bayangan menyebar
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Field Nama
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Color(0xFF697684), // Warna tautan
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Jarak antara Text dan TextField
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14), // Jarak antar field
                      // Field Email
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF697684), // Warna tautan
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Jarak antara Text dan TextField
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14), // Jarak antar field
                      // Field Password
                      const PasswordField(label: 'Password'),
                      const SizedBox(
                          height: 8), // Jarak sebelum forgot password
                      // Tautan Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Aksi saat ditekan
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF697684), // Warna tautan
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Jarak sebelum tombol login
                      // Tombol Login
                      SizedBox(
                        width: double.infinity, // Set the width to infinity
                        child: ElevatedButton(
                          onPressed: () {
                            // Aksi saat tombol login ditekan
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (Route<dynamic> route) =>
                                  false, // Menghapus semua route sebelumnya
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF697684), // Warna tombol
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Jarak sebelum tautan registrasi
                      // Tautan untuk registrasi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Color(0xFF697684)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Aksi saat tautan register ditekan
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreenMember(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xFF697684),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
