import 'package:artify_app/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:artify_app/features/onboarding/presentation/widgets/title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() goToHomePage;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.goToHomePage,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Image with Skip Button
        OnboardingHeader(onSkip: goToHomePage, imagePath: imagePath),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),

          child: TitleSubtitle(title: title, subTitle: subTitle),
        ),
      ],
    );
  }
}
