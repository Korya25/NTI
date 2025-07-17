import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SlideInFromLeft extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration? delay;

  const SlideInFromLeft({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      duration: duration,
      delay: delay ?? Duration.zero,
      child: child,
    );
  }
}

class SlideInFromRight extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration? delay;

  const SlideInFromRight({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      duration: duration,
      delay: delay ?? Duration.zero,
      child: child,
    );
  }
}

class SlideInFromTop extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration? delay;

  const SlideInFromTop({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      duration: duration,
      delay: delay ?? Duration.zero,
      child: child,
    );
  }
}

class SlideInFromBottom extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration? delay;

  const SlideInFromBottom({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      duration: duration,
      delay: delay ?? Duration.zero,
      child: child,
    );
  }
}

class FadeInFast extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration? delay;

  const FadeInFast({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: duration,
      delay: delay ?? Duration.zero,
      child: child,
    );
  }
}

class BounceInScale extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration? delay;

  const BounceInScale({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      duration: duration,
      delay: delay ?? Duration.zero,
      child: child,
    );
  }
}

class PulsingWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double scale;

  const PulsingWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.scale = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Pulse(
      duration: duration,
      infinite: true,
      manualTrigger: false,
      from: scale,
      child: child,
    );
  }
}


class FlashingOpacity extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double minOpacity;
  final double maxOpacity;

  const FlashingOpacity({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.minOpacity = 0.2,
    this.maxOpacity = 1.0,
  });

  @override
  State<FlashingOpacity> createState() => _FlashingOpacityState();
}

class _FlashingOpacityState extends State<FlashingOpacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: widget.minOpacity,
      end: widget.maxOpacity,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Opacity(
          opacity: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
