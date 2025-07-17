// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/core/utils/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => _handleContactAction(context),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primaryText.withOpacity(0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primaryText, size: 20.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.roboto16Secondary600,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value,
                    style: AppTextStyles.roboto14Secondary400,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryText.withOpacity(0.6),
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _handleContactAction(BuildContext context) {
    switch (icon) {
      case Icons.phone:
        AppDialog.showContactDialog(
          context: context,
          title: title,
          value: value,
          icon: icon,
          onAction: () => _makePhoneCall(value),
          actionLabel: 'Call',
        );
        break;
      case Icons.email:
        AppDialog.showContactDialog(
          context: context,
          title: title,
          value: value,
          icon: icon,
          onAction: () => _sendEmail(value),
          actionLabel: 'Email',
        );
        break;
      case Icons.language:
        AppDialog.showContactDialog(
          context: context,
          title: title,
          value: value,
          icon: icon,
          onAction: () => _openWebsite(value),
          actionLabel: 'Visit',
        );
        break;
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _sendEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _openWebsite(String website) async {
    String url = website;
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

