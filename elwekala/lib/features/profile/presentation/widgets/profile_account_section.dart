import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:elwekala/features/profile/presentation/widgets/profile_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAccountSection extends StatelessWidget {
  const ProfileAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTitleSection(title: AppStrings.account),

        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(13),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              ProfileMenuItem(
                icon: Icons.phone_outlined,
                title: AppStrings.phoneNumber,
                onTap: () {},
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ProfileMenuItem(
                icon: Icons.security_outlined,
                title: AppStrings.twoStepVerification,
                onTap: () {},
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ProfileMenuItem(
                icon: Icons.lock_outline,
                title: AppStrings.passcode,
                onTap: () {},
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ProfileMenuItem(
                icon: Icons.email_outlined,
                title: AppStrings.emailAddress,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
