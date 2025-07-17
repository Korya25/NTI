// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/core/utils/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationItem extends StatelessWidget {
  final String office;
  final String address;
  final double? latitude;
  final double? longitude;

  const LocationItem({
    super.key,
    required this.office,
    required this.address,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppDialog.showLocationDialog(
        context: context,
        office: office,
        address: address,
        latitude: latitude,
        longitude: longitude,
      ),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.only(left: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primaryText.withOpacity(0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on, color: AppColors.primaryText, size: 16.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$office: ',
                      style: AppTextStyles.roboto14Primary600,
                    ),
                    TextSpan(
                      text: address,
                      style: AppTextStyles.roboto14Secondary400,
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryText.withOpacity(0.6),
              size: 12.sp,
            ),
          ],
        ),
      ),
    );
  }
}
