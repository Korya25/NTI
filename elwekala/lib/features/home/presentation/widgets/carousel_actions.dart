import 'package:elwekala/features/favorites/presentation/widgets/favorite_button.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elwekala/core/widgets/ios_back_button.dart';

class CarouselActions extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoritePressed;
  final VoidCallback onBackPressed;

  const CarouselActions({
    super.key,
    required this.product,
    required this.onFavoritePressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20.w,
          top: 20.h,
          child: FavoriteButton(product:product ,
          ),
        ),
        Positioned(
          left: 20.w,
          top: 20.h,
          child: IOSBackButton(onPressed: onBackPressed),
        ),
      ],
    );
  }
}