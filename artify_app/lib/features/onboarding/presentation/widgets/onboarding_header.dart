import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_text_style.dart';
import 'package:artify_app/features/onboarding/presentation/widgets/fade_out_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onSkip;
  final String imagePath;

  const OnboardingHeader({
    super.key,
    required this.onSkip,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeOutImage(
          imageWidget: Image.asset(
            height: 444.h,
            width: MediaQuery.of(context).size.width,
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 16,
          top: 50,
          child: GestureDetector(
            onTap: onSkip,
            child: Text(AppString.skipButton, style: AppTextStyle.skipButton),
          ),
        ),
      ],
    );
  }
}
