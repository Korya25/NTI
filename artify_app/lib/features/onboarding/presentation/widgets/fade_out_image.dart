import 'package:flutter/material.dart';

class FadeOutImage extends StatelessWidget {
  const FadeOutImage({super.key, required this.imageWidget});
  final Widget imageWidget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback:
          (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white, Colors.transparent],
            stops: [0.0, 0.78, 1.0],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.dstIn,
      child: imageWidget,
    );
  }
}
