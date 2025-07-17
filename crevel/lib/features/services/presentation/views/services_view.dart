// ignore_for_file: deprecated_member_use

import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/services/data/data/services_data.dart';
import 'package:crevel/features/services/presentation/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Text(
                  'SERVICES',
                  style: AppTextStyles.roboto36Primary700,
                ),
              ),
              SizedBox(height: 40.h),
              const _ServicesListEnhanced(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServicesListEnhanced extends StatelessWidget {
  const _ServicesListEnhanced();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ServicesData.services
          .map(
            (service) => Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: ServiceCard(
                icon: ServicesData.getIconData(service.iconName),
                title: service.title,
                description: service.description,
              ),
            ),
          )
          .toList(),
    );
  }
}