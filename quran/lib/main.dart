import 'package:flutter/material.dart';
import 'package:quran/views/home_screen.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        fontFamily: 'Amiri',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
