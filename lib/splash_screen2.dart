import 'dart:async';
import 'package:flutter/material.dart';
import 'features/authentication/role.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState(); // Call the superclass's initState method
// Mulai timer untuk navigasi ke SplashScreen2 setelah 2 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  // Membuat route dengan animasi fade
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SelectRole(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0; // Memulai dari transparan
        const end = 1.0; // Berhenti di tampilan penuh
        const curve = Curves.easeInOut; // Kurva animasi

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // Durasi transisi
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LOGOACTIVECORE2.png',
              width: 300, // Ganti dengan lebar yang diinginkan
              height: 300, // Ganti dengan tinggi yang diinginkan
              fit: BoxFit.contain, // Menjaga rasio aspek gambar
            ),
          ],
        ),
      ),
    );
  }
}
