import 'package:crevel/core/constants/app_assets.dart';
import 'package:crevel/core/presentation/widgets/animated_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'animated_asset_image.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.05.sh,
          right: 0.05.sw,
          child: AnimatedStar(size: 0.08.sw),
        ),
        Positioned(
          top: 0.45.sh,
          right: -0.05.sw,
          child: AnimatedStar(size: 0.15.sw, rotationAngle: 0.2),
        ),
        Positioned(
          top: 0.45.sh,
          left: -0.05.sw,
          child: AnimatedStar(size: 0.15.sw, rotationAngle: -0.2),
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: const [
              AnimatedAssetImage(
                assetPath: AppAssets.appNameNotV,
                initialOffset: Offset(0.0, 1.0),
              ),
              AnimatedAssetImage(
                assetPath: AppAssets.vIcon,
                initialOffset: Offset(0.0, -1.0),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.05.sh,
          left: 0.05.sw,
          child: AnimatedStar(size: 0.08.sw),
        ),
      ],
    );
  }
}