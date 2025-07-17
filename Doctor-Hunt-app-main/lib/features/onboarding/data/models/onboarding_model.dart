import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';

class OnboardingModel {
  final String image;
  final String background;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.background,
    required this.title,
    required this.subtitle,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppImages.onboarding[0],
      title: AppString.onboardingTitles[0],
      subtitle: AppString.onboardingSubtitles[0],
      background: AppImages.onboardingBackground[0],
    ),
    OnboardingModel(
      image: AppImages.onboarding[1],
      title: AppString.onboardingTitles[1],
      subtitle: AppString.onboardingSubtitles[1],
      background: AppImages.onboardingBackground[1],
    ),
    OnboardingModel(
      image: AppImages.onboarding[2],
      title: AppString.onboardingTitles[2],
      subtitle: AppString.onboardingSubtitles[2],
      background: AppImages.onboardingBackground[0],
    ),
  ];
}
