import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/presentation/views/main_view.dart';
import 'package:simple_whats_app/core/resources/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
