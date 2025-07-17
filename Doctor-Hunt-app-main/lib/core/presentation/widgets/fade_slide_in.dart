import 'package:flutter/material.dart';

class FadeSlideIn extends StatelessWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.beginOffsetY = 80.0,
    this.curve = Curves.easeOut,
  });

  final Widget child;
  final Duration duration;
  final double beginOffsetY;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, beginOffsetY * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
