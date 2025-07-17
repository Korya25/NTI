
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/core/resources/app_routes.dart';
import 'package:artify_app/features/onboarding/presentation/widgets/onboarding_bottom.dart';
import 'package:artify_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingView> {
  final PageController _controller = PageController();
  final int _totalPages = 3;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    context.goNamed(AppRoutes.home);
  }

  void _goToNext() {
    final currentPage = _controller.page;
    if (currentPage != null && currentPage.round() < _totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          // Page View
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                OnboardingPage(
                  title: AppString.titleOnboarding1,
                  subTitle: AppString.subTitleOnboarding1,
                  goToHomePage: _navigateToHome,
                  imagePath: AppImages.onboardingImage1,
                ),
                OnboardingPage(
                  title: AppString.titleOnboarding2,
                  subTitle: AppString.subTitleOnboarding2,
                  goToHomePage: _navigateToHome,
                  imagePath: AppImages.onboardingImage2,
                ),
                OnboardingPage(
                  title: AppString.titleOnboarding3,
                  subTitle: AppString.subTitleOnboarding3,
                  goToHomePage: _navigateToHome,
                  imagePath: AppImages.onboardingImage3,
                ),
              ],
            ),
          ),

          // Bottom Controls
          OnboardingBottom(
            pageController: _controller,
            count: _totalPages,
            onNext: _goToNext,
          ),
        ],
      ),
    );
  }
}
