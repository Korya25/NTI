// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SplashProgressIndicator extends StatefulWidget {
  const SplashProgressIndicator({super.key});

  @override
  State<SplashProgressIndicator> createState() => _SplashProgressIndicatorState();
}

class _SplashProgressIndicatorState extends State<SplashProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CircularProgressIndicator(
          value: _controller.value,
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: Colors.white.withOpacity(0.3),
        );
      },
    );
  }
}