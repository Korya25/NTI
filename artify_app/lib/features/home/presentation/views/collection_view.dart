import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:artify_app/features/home/presentation/widgets/collection_content.dart';
import 'package:artify_app/features/home/presentation/widgets/detail_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            children: const [
              Gap(40),
              DetailHeader(title: AppString.collection),
              Gap(30),
              CollectionContent(),
            ],
          ),
        ),
      ),
    );
  }
}
