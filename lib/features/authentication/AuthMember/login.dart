import 'package:active_core/api/auth_services.dart';
import 'package:active_core/features/authentication/AuthMember/register.dart';
import 'package:active_core/home_screen_member.dart';
import 'package:active_core/widget/passwordfield.dart';
import 'package:flutter/material.dart';

class LoginScreenMember extends StatefulWidget {
  const LoginScreenMember({super.key});

  @override
  LoginScreenMemberState createState() => LoginScreenMemberState();
}

class LoginScreenMemberState extends State<LoginScreenMember> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage; // Menyimpan pesan kesalahan

  Future<void> _login() async {
    // Ambil nilai dari controller
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Panggil fungsi login dari AuthService
    final result = await AuthService().login(name, email, password);
    
    if (mounted) { // Cek apakah widget masih terpasang
      if (result != null && result['role'] == 'member') {
        // Jika login berhasil dan role adalah 'member', navigasi ke HomeScreen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreenMember()),
          (Route<dynamic> route) => false, // Menghapus semua route sebelumnya
        );
      } else {
        // Jika login gagal atau role bukan 'member', tampilkan pesan kesalahan
        setState(() {
          _errorMessage = 'Login failed. Please check your credentials or ensure you are a member.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF697684), 
              Colors.white, 
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
                  width: 100, 
                  height: 100, 
                ),
                const SizedBox(height: 8), // Jarak antara logo dan teks
                // Judul
                const Text(
                  'Sign in to your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
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
                const SizedBox(height: 20), // Jarak sebelum form
                // Form
                Container(
                  height: 510,
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius:
                        BorderRadius.circular(8.0), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), 
                        offset: const Offset(0, 4), 
                        blurRadius: 8, 
                        spreadRadius: 4,
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
                      const SizedBox(height: 8), // Jarak antara Text dan TextField
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
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
                      const SizedBox(height: 8), // Jarak antara Text dan TextField
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14), // Jarak antar field
                      // Field Password
                      PasswordField(label: 'Password', controller: _passwordController),
                      const SizedBox(height: 8), // Jarak sebelum forgot password
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
                              color: Color(0xFF697684), 
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Jarak sebelum tombol login
                      // Tombol Login
                      SizedBox(
                        width: double.infinity, // Set the width to infinity
                        child: ElevatedButton(
                          onPressed: _login, // Panggil fungsi login
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF697684), // Warna tombol
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
                      // Menampilkan pesan kesalahan
                      _centeredErrorMessage(),
                      const SizedBox(height: 10), // Jarak sebelum tautan registrasi
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
                                      const RegisterScreenMember(role: 'member'),
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

  Widget _centeredErrorMessage() {
    return _errorMessage != null
        ? Align(
            alignment: Alignment.center, // Center the error message
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0), // Optional: add some space above
              child: Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center, // Center text alignment
              ),
            ),
          )
        : Container();
  }
}
