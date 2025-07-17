import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleSub extends StatelessWidget {
  const TitleSub({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          title,
          textAlign: TextAlign.center,

          style: AppTextStyles.rubik28MediumPrimary,
        ),

        // Subtitle
        Text(
          subtitle,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: AppTextStyles.rubik14RegularTertiary,
        ),
      ],
    );
  }
}
