import 'package:flutter/material.dart';

class CharContiner extends StatelessWidget {
  const CharContiner({
    super.key,
    required this.textWidget,
    this.height,
    this.width,
    required this.backgroundColor,
    this.borderRadius,
  });

  final Widget textWidget;
  final Color backgroundColor;
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      child: textWidget,
    );
  }
}
