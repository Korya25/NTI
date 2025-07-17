import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/onboarding_background.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/features/onboarding/data/models/onboarding_model.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/onboarding_buttom.dart';
import 'package:doctor_hunt/features/onboarding/presentation/widgets/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController pageController;
  int currentIndex = 0;
  final List<OnboardingModel> onboardingList = OnboardingModel.onboardingList;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(onPageChanged);
  }

  void onPageChanged() {
    if (!pageController.hasClients) return;
    final newIndex = pageController.page?.round() ?? 0;
    if (newIndex != currentIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  DecorationImage get backgroundImage {
    final bgIndex = currentIndex % 2;
    return DecorationImage(
      image: AssetImage(onboardingList[bgIndex].background),
      fit: BoxFit.cover,
    );
  }

  @override
  void dispose() {
    pageController.removeListener(onPageChanged);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OnboardingBackground(
        isTopContainerLeft: currentIndex % 2 == 0,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingList.length,
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return OnboardingItems(
                    image: item.image,
                    title: item.title,
                    subtitle: item.subtitle,
                  );
                },
              ),
            ),
            Padding(
              padding: AppPadding.horizontal25,
              child: OnboardingButtom(
                // add dut=ratiom
                getStartedOnTap: () {
                  context.goNamed(AppRoutes.signupView);
                },
                nextOnTap: () {
                  if (currentIndex < onboardingList.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    context.goNamed(AppRoutes.signupView);
                  }
                },
                disableNextOnTap: currentIndex >= onboardingList.length - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
