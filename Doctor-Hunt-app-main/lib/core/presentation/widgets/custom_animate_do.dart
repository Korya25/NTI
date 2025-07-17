import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

enum FadeDirection { down, up, left, right }

class CustomFadeIn extends StatelessWidget {
  const CustomFadeIn({
    super.key,
    required this.child,
    this.duration = 800,
    this.delay = 300,
    this.direction = FadeDirection.down,
  });

  final Widget child;
  final int duration;
  final int delay;
  final FadeDirection direction;

  @override
  Widget build(BuildContext context) {
    final Duration animationDuration = Duration(milliseconds: duration);
    final Duration animationDelay = Duration(milliseconds: delay);

    switch (direction) {
      case FadeDirection.down:
        return FadeInDown(
          duration: animationDuration,
          delay: animationDelay,
          child: child,
        );
      case FadeDirection.up:
        return FadeInUp(
          duration: animationDuration,
          delay: animationDelay,
          child: child,
        );
      case FadeDirection.left:
        return FadeInLeft(
          duration: animationDuration,
          delay: animationDelay,
          child: child,
        );
      case FadeDirection.right:
        return FadeInRight(
          duration: animationDuration,
          delay: animationDelay,
          child: child,
        );
    }
  }
}
