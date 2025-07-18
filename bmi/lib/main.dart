
import 'package:bmi/core/screens/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'core/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: BMIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}