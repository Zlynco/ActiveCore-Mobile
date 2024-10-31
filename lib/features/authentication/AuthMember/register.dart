import 'package:active_core/widget/pwfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:active_core/features/authentication/AuthMember/login.dart';

class RegisterScreenMember extends StatefulWidget {
  final String role;

  const RegisterScreenMember({super.key, required this.role});

  @override
  RegisterScreenMemberState createState() => RegisterScreenMemberState();
}

class RegisterScreenMemberState extends State<RegisterScreenMember> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register(BuildContext context) {
    // Validasi input
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phoneNumber = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordconfirmation = confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        password.isEmpty ||
        passwordconfirmation.isEmpty) {
      // Tampilkan snackbar atau dialog untuk menunjukkan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (password != passwordconfirmation) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    // Tambahkan logika untuk menyimpan data pengguna ke database di sini
    // Jika registrasi berhasil, arahkan ke halaman login
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful!')),
    );

    // Arahkan pengguna kembali ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreenMember(),
      ),
    );
  }

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
                Text(
                  'Register as ${widget.role}', // Menampilkan role yang dipilih
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8), // Jarak antara judul dan subjudul
                const Text(
                  'Create your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40), // Jarak sebelum form
                // Form
                Container(
                  height: 620,
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
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Color(0xFF697684),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF697684),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Color(0xFF697684),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      PasswordField(
                          label: 'Password', controller: passwordController),
                      const SizedBox(height: 14),
                      PasswordField(
                          label: 'Confirm Password',
                          controller: confirmPasswordController),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            register(context); // Panggil fungsi register dengan konteks
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF697684),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an Account? ",
                            style: TextStyle(color: Color(0xFF697684)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginScreenMember(),
                                ),
                              );
                            },
                            child: const Text(
                              'Log In',
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
