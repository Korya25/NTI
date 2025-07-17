import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      child: Image.asset(
        image,
        height: 220.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
