// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/*
CustomOverlayFactory.show(
  context,
  message: "Feature under development!",
  icon: Icons.construction,
  duration: Duration(seconds: 4),
  backgroundColor: Colors.deepOrange,
);

*/
class CustomOverlayFactory {
  static void show(
    BuildContext context, {
    IconData icon = Icons.rocket_launch,
    String message = 'Soon',
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = AppColors.primaryText,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => CustomAnimatedOverlay(
        icon: icon,
        message: message,
        duration: duration,
        backgroundColor: backgroundColor,
        onDismiss: () => overlayEntry.remove(),
      ),
    );

    overlay.insert(overlayEntry);
  }
}

class CustomAnimatedOverlay extends StatefulWidget {
  final VoidCallback onDismiss;
  final IconData icon;
  final String message;
  final Duration duration;
  final Color backgroundColor;

  const CustomAnimatedOverlay({
    super.key,
    required this.onDismiss,
    this.icon = Icons.rocket_launch,
    this.message = "Soon",
    this.duration = const Duration(seconds: 3),
    this.backgroundColor = const Color(0xFF333333),
  });

  @override
  State<CustomAnimatedOverlay> createState() => _CustomAnimatedOverlayState();
}

class _CustomAnimatedOverlayState extends State<CustomAnimatedOverlay>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.bounceOut),
        );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_slideController);

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _slideController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _scaleController.forward();
    });

    // Auto dismiss
    Future.delayed(widget.duration, () {
      if (mounted) widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.backgroundColor,
                    widget.backgroundColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: widget.backgroundColor.withOpacity(0.5),
                    offset: const Offset(0, 8),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Icon(widget.icon, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _scaleController.value,
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
