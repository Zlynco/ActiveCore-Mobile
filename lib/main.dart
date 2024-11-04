import 'package:flutter/material.dart';
import './splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, // Mengatur warna latar belakang navbar
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey, // Menetapkan warna item yang tidak terpilih
        ),
      ),
      title: 'ActiveCore',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}