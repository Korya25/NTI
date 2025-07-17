import 'package:crevel/features/aboutUs/data/data/about_us_data.dart';
import 'package:crevel/features/aboutUs/presentation/widgets/gallery_grid.dart';
import 'package:flutter/material.dart';
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AboutUsData.galleryItems;

    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text('ABOUT US', style: AppTextStyles.roboto36Primary700),
              const SizedBox(height: 24),
              Text(
                AboutUsData.aboutUsText.trim(),
                style: AppTextStyles.roboto16Secondary400,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40),
              GalleryGrid(items: items),
            ],
          ),
        ),
      ),
    );
  }
}
