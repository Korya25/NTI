
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Text('BLOG', style: AppTextStyles.roboto36Primary700),
          SizedBox(height: 24.h),
          Text(
            'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Qui in doloribus, distinctio impedit autem ad enim voluptates blanditiis obcaecati dignissimos sapiente maiores ipsa fuga sunt, veritatis pariatur eum. Obcaecati, sint.',
            style: AppTextStyles.roboto16Secondary400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
