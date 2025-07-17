// ignore_for_file: deprecated_member_use

import 'package:counter_app/core/router/app_routes.dart';
import 'package:counter_app/features/splash/presentation/widget/splash_progress.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IslamicSplashScreen extends StatefulWidget {
  const IslamicSplashScreen({super.key});

  @override
  State<IslamicSplashScreen> createState() => _IslamicSplashScreenState();
}

class _IslamicSplashScreenState extends State<IslamicSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToHome();
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        context.goNamed(AppRoutes.homeView);
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Colors.green.shade300,
              Colors.green.shade600,
              Colors.green.shade900,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedIslamicStar(),
              const SizedBox(height: 40),
              _buildArabicTitle(),
              const SizedBox(height: 10),
              _buildEnglishTitle(),
              const SizedBox(height: 60),
              const SplashProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIslamicStar() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.4),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.mosque,
              size: 50,
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }

  Widget _buildArabicTitle() {
    return Text(
      'تطبيق الذكر',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(
            offset: const Offset(2, 2),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildEnglishTitle() {
    return Text(
      'Zikr App',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      ),
    );
  }
}