import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elwekala/core/constants/app_colors.dart';

class CircularNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CircularNetworkImage({
    super.key,
    required this.imageUrl,
    this.size = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w - 10,
      height: size.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.borderColor, width: 2),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.secondaryColor,
              child: Icon(
                Icons.person,
                size: size.sp / 2,
                color: AppColors.iconColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
