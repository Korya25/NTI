
import 'package:crevel/core/presentation/widgets/animated_star.dart';
import 'package:crevel/core/presentation/widgets/menu_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarDecoration extends StatelessWidget {
  const StarDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTopRightStar(),
        _buildBottomLeftStar(),
      ],
    );
  }

  Widget _buildTopRightStar() {
    return Positioned(
      right: 1.sw * MenuConstants.starPositionFactor,
      top: 1.sh * MenuConstants.topStarPositionFactor,
      child: AnimatedStar(
        size: 1.sw * MenuConstants.smallStarSizeFactor,
      ),
    );
  }

  Widget _buildBottomLeftStar() {
    return Positioned(
      left: 1.sw * MenuConstants.bottomStarLeftPositionFactor,
      bottom: 1.sh * MenuConstants.bottomStarPositionFactor,
      child: AnimatedStar(
        size: 1.sw * MenuConstants.smallStarSizeFactor,
      ),
    );
  }
}
