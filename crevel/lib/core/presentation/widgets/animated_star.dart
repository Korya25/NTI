import 'package:crevel/core/constants/app_assets.dart';
import 'package:crevel/core/presentation/widgets/app_animations.dart';
import 'package:flutter/material.dart';

class AnimatedStar extends StatelessWidget {
  final double size;
  final double rotationAngle;
  final bool stars;
  final bool animate;

  const AnimatedStar({
    super.key,
    required this.size,
    this.rotationAngle = 0,
    this.stars = false,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return animate
        ? PulsingWidget(
            duration: const Duration(seconds: 5),
            child: Transform.rotate(
              angle: rotationAngle,
              child: Image.asset(
                stars ? AppAssets.stars : AppAssets.star,
                height: size,
                width: size,
                fit: BoxFit.contain,
              ),
            ),
          )
        : Transform.rotate(
            angle: rotationAngle,
            child: Image.asset(
              stars ? AppAssets.stars : AppAssets.star,
              height: size,
              width: size,
              fit: BoxFit.contain,
            ),
          );
  }
}
