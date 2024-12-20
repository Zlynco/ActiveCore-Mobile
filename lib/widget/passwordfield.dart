// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label; // Parameter untuk teks label
  final TextEditingController controller; // Tambahkan parameter controller

  const PasswordField({
    super.key,
    required this.label,
    required this.controller, // Tambahkan controller sebagai parameter
  });

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true; // Status visibilitas password

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label, // Gunakan label yang diteruskan ke widget
          style: const TextStyle(
            color: Color(0xFF697684), // Warna tautan
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Jarak antara Text dan TextField
        TextField(
          obscureText: _isObscured, // Menggunakan status visibilitas
          controller: widget.controller, // Gunakan controller yang diteruskan
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF697684), // Warna ikon
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured; // Mengubah status visibilitas
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}