import 'dart:async';
import 'package:flutter/material.dart';
import './home_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState(); // Call the superclass's initState method

    // Start a timer to navigate to the HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
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
