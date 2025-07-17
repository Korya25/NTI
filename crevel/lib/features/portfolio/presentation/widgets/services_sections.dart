

import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/portfolio/presentation/widgets/portfolio_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PortfolioServicesSections extends StatelessWidget {
  const PortfolioServicesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore Social Media designs',
          style: AppTextStyles.roboto28Secondary700.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 15.h),
        _buildMobileServices(),
      ],
    );
  }

  Widget _buildMobileServices() {
    return Column(
      children: [
        const PortfolioServiceCard(
          title: 'SOCIAL MEDIA',
          description:
              'Build your brand and engage your audience with content & analytics.',
          imagePath: 'assets/images/social_media.png',
        ),
        SizedBox(height: 20.h),
        const PortfolioServiceCard(
          title: 'UI DESIGN',
          description:
              'Clean and intuitive UI/UX design that improves user experience.',
          imagePath: 'assets/images/ui_design.png',
        ),
        SizedBox(height: 20.h),
        const PortfolioServiceCard(
          title: 'WEB DEV',
          description:
              'Build fast and responsive websites using modern technologies.',
          imagePath: 'assets/images/web_dev.png',
        ),
      ],
    );
  }
}
