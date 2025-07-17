import 'package:doctor_hunt/core/presentation/widgets/transform_animated_widget.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.cardModel});
  final CategoryCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        gradient: cardModel.gradient,
        // ignore: use_full_hex_values_for_flutter_colors
        color: cardModel.gradient == null ? Color(0xfffffff) : null,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: TransformAnimatedWidget(
          child: SvgPicture.asset(
            cardModel.svgPath,
            colorFilter: cardModel.gradient != null
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}
