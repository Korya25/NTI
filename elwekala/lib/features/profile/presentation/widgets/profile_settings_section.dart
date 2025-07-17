import 'package:elwekala/core/cache/cache_helper.dart';
import 'package:elwekala/core/cache/cache_keys.dart';
import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/features/profile/presentation/controller/profile_cubit.dart';
import 'package:elwekala/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:elwekala/features/profile/presentation/widgets/profile_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTitleSection(title: AppStrings.settings),

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
                icon: Icons.privacy_tip_outlined,
                title: AppStrings.privacy,
                onTap: () {},
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ProfileMenuItem(
                icon: Icons.favorite_outline,
                title: AppStrings.matching,
                onTap: () {},
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ProfileMenuItem(
                icon: Icons.delete,
                title: 'Delete Account',
                titleColor: AppColors.errorColor,
                onTap: () {
                  Navigator.of(context).pop();
                  final token = CacheHelper.sharedPreferences.getString(
                    CacheKeys.token,
                  );
                  if (token != null) {
                    context.read<ProfileCubit>().deleteProfile(
                      token: token,
                      email: user.email,
                    );
                  }
                  context.go(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
