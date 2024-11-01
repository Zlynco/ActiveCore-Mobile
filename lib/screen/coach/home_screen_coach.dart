import 'package:flutter/material.dart';

class HomeScreenCoach extends StatelessWidget {
  const HomeScreenCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActiveCore'),centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Coach Home Page!'),
      ),
    );
  }
}
