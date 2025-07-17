import 'package:elwekala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _buildButtonStyle(),
        child: isLoading
            ? _LoadingIndicator(color: textColor ?? Colors.white)
            : _ButtonTitle(text: text),
      ),
    );
  }
}

ButtonStyle _buildButtonStyle({
  Color? backgroundColor,
  Color? textColor,
  EdgeInsetsGeometry? padding,
}) {
  return ElevatedButton.styleFrom(
    backgroundColor: backgroundColor ?? AppColors.primaryColor,
    foregroundColor: textColor ?? Colors.white,
    padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  );
}

class _ButtonTitle extends StatelessWidget {
  final String text;

  const _ButtonTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  final Color color;

  const _LoadingIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 20.w,
        height: 20.h,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
