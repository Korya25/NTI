import 'package:flutter/material.dart';



class AnimatedAssetImage extends StatefulWidget {
  final String assetPath;
  final Offset initialOffset;
  final double widthFactor;
  final double heightFactor;
  final Duration duration;

  const AnimatedAssetImage({
    super.key,
    required this.assetPath,
    required this.initialOffset,
    this.widthFactor = 0.6,
    this.heightFactor = 0.6,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<AnimatedAssetImage> createState() => _AnimatedAssetImageState();
}

class _AnimatedAssetImageState extends State<AnimatedAssetImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();
    
    _slideAnimation = Tween<Offset>(
      begin: widget.initialOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Image.asset(
          widget.assetPath,
          width: size.width * widget.widthFactor,
          height: size.height * widget.heightFactor,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}