import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/fade_slide_in.dart';
import 'package:doctor_hunt/core/presentation/widgets/transform_animated_widget.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/title_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItems extends StatelessWidget {
  const OnboardingItems({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18.h,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Image
        TransformAnimatedWidget(
          child: CircleAvatar(
            radius: 180.r,
            backgroundImage: AssetImage(image),
          ),
        ),
        // Title and Subtitle
        Padding(
          padding: AppPadding.horizontal25,
          child: FadeSlideIn(
            child: TitleSub(title: title, subtitle: subtitle),
          ),
        ),
      ],
    );
  }
}
