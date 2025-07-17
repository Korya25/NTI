import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVerticalListView extends StatelessWidget {
  const CustomVerticalListView({
    super.key,
    this.padding,
    required this.itemCount,
    required this.itemBuilder,
  });
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return CustomFadeIn(
      direction: FadeDirection.up,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: padding ?? EdgeInsets.zero,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16.h);
        },
      ),
    );
  }
}
