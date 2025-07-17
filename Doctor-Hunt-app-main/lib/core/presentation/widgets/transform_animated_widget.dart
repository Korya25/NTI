import 'dart:math';

import 'package:flutter/material.dart';

class TransformAnimatedWidget extends StatefulWidget {
  const TransformAnimatedWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeOut,
    this.scale = const AnimatedTransformValue(begin: 0.0, end: 1.0),
    this.rotation,
    this.translation,
    this.flip = false,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;
  final AnimatedTransformValue scale;
  final AnimatedTransformValue? rotation;
  final Offset? translation;
  final bool flip;

  @override
  State<TransformAnimatedWidget> createState() =>
      _TransformAnimatedWidgetState();
}

class AnimatedTransformValue {
  final double begin;
  final double end;

  const AnimatedTransformValue({required this.begin, required this.end});
}

class _TransformAnimatedWidgetState extends State<TransformAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: widget.duration,
      curve: widget.curve,
      builder: (context, value, _) {
        final scale = _lerp(widget.scale.begin, widget.scale.end, value);
        final rotation = widget.rotation != null
            ? _lerp(widget.rotation!.begin, widget.rotation!.end, value)
            : 0.0;
        final translation = widget.translation != null
            ? Offset(
                widget.translation!.dx * value,
                widget.translation!.dy * value,
              )
            : Offset.zero;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(translation.dx, translation.dy)
            ..scale(scale, scale, 1.0)
            ..rotateZ(rotation)
            ..rotateY(widget.flip ? value * pi : 0.0),
          child: widget.child,
        );
      },
    );
  }

  double _lerp(double begin, double end, double t) {
    return begin + (end - begin) * t;
  }
}


// ================== Hoe To Use ==================
/*
TransformAnimatedWidget(
  duration: Duration(milliseconds: 800),
  curve: Curves.easeInOutBack,
  scale: AnimatedTransformValue(begin: 0.5, end: 1.2),
  rotation: AnimatedTransformValue(begin: 0, end: 2 * pi), 
  translation: Offset(50.w, 0), 
  flip: true, 
  child: YourWidget(),
)
*/