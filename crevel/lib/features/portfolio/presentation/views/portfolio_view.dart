
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/presentation/widgets/app_animations.dart';
import 'package:crevel/core/utils/animated_devider.dart';
import 'package:crevel/features/portfolio/presentation/widgets/portfolio_cards.dart';
import 'package:crevel/features/portfolio/presentation/widgets/portfolio_header.dart';
import 'package:crevel/features/portfolio/presentation/widgets/services_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const PortfolioViewBody(),
        ),
      ),
    );
  }
}

class PortfolioViewBody extends StatelessWidget {
  const PortfolioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 70.h),
        SlideInFromRight(child: const PortfolioHeader()),
        AnimatedDivider(),
        SlideInFromLeft(child: const PortfolioCards()),
        AnimatedDivider(),
        SlideInFromRight(child: const PortfolioServicesSections()),
      ],
    );
  }
}
