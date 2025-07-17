import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainerActionIcon extends StatelessWidget {
  const CustomContainerActionIcon({
    super.key,
    this.onTap,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
  });
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.containerColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: iconColor ?? AppColors.secondaryIcon),
          ),
        ),
      ),
    );
  }
}
