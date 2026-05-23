import 'package:flutter/material.dart';
import 'login.dart'; // This connects your main file to your login screen

void main() {
  runApp(const ShrineApp());
}

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shrine',
      home: LoginPage(), // This tells Flutter to open your login page on startup
      initialRoute: '/login',
    );
  }
}