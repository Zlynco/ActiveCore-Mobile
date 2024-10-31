import 'package:flutter/material.dart';

class HomeScreenMember extends StatelessWidget {
  const HomeScreenMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActiveCore'),centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Member Home Page!'),
      ),
    );
  }
}
