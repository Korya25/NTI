
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewOnBlogSection extends StatelessWidget {
  const NewOnBlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New on the Blog', style: AppTextStyles.roboto28Primary600),
          SizedBox(height: 24.h),
          Column(
            children: [
              BlogCard(
                title: 'Tech Acquisitions 2021',
                description:
                    'The biggest enterprise technology acquisitions in reverse order.',
                imageUrl:
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop',
              ),
              SizedBox(height: 16.h),
              BlogCard(
                title: 'Future of Technology',
                description:
                    'Exploring the latest trends in enterprise technology.',
                imageUrl:
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
