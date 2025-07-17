
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/blog/presentation/widgets/tech_article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.secondaryText),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Popular', style: AppTextStyles.roboto28Primary600),
          SizedBox(height: 24.h),
          TechArticleCard(
            title: 'Noteworthy Technology Acquisitions 2021',
            description:
                'Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.',
            imageUrl:
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
          ),
        ],
      ),
    );
  }
}
