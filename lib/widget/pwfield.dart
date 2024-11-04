import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label; // Parameter untuk teks label
  final TextEditingController controller; // Menyimpan controller

  const PasswordField({
    super.key,
    required this.label,
    required this.controller, // Simpan controller
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
          widget.label, // Menggunakan label yang diteruskan ke widget
          style: const TextStyle(
            color: Color(0xFF697684), // Warna label
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Jarak antara Text dan TextField
        TextField(
          controller: widget.controller, // Gunakan controller yang disimpan
          obscureText: _isObscured, // Menggunakan status visibilitas
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
