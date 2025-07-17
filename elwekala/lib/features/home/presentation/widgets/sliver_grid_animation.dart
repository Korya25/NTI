
import 'package:flutter/material.dart';

class SliverGridAnimation extends StatelessWidget {
  const SliverGridAnimation({
    super.key,
    required this.productIndex,
    required this.child,
  });

  final int productIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool fromRight = productIndex % 2 == 0;
    return TweenAnimationBuilder<Offset>(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      tween: Tween<Offset>(
        begin: Offset(fromRight ? -1.0 : 1.0, 0),
        end: Offset.zero,
      ),
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(offset.dx * 220, 0),
          child: child,
        );
      },
      child: child,
    );
  }
}
