import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/presentation/widgets/custom_rich_text.dart';
import 'package:crevel/core/presentation/widgets/social_media_widget.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/home/presentation/widgets/home_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.titleStyle,
    this.padding,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Text(
        title,
        style:
            titleStyle ??
            AppTextStyles.roboto36Primary700.copyWith(
              fontSize: 32.sp,
              letterSpacing: 2.0,
            ),
        textAlign: textAlign,
      ),
    );
  }
}


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeSection,
      body: Stack(children: [const HomeBackgroundWidget(), HomeViewBody()]),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // Hero Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.15.sh),
                    // Slogan
                    CustomRichText(
                      firstText: "We don't just\nmarket",
                      secondText: "we dominate the\ndigital space",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20.h),
                    SocialMediaWidgetCustom(
                      layout: SocialMediaLayout.horizontal,
                      alignment: SocialMediaAlignment.left,
                      spacing: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
