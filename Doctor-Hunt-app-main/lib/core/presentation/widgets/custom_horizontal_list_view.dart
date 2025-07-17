import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.height,
  });
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 180.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10.w);
        },
      ),
    );
  }
}
