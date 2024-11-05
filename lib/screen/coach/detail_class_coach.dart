import 'package:flutter/material.dart';

class DetailClassCoach extends StatelessWidget {
  final String className;

  const DetailClassCoach({super.key, required this.className});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Class'),
      ),
      backgroundColor: const Color(0xFFEFEFEF), // Ganti dengan warna yang diinginkan
      body: Center(
        child: Text(
          className,
          style: const TextStyle(fontSize: 24), // Menambahkan ukuran font untuk lebih jelas
        ),
      ),
    );
  }
}
