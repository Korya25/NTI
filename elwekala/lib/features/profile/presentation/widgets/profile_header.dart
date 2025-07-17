import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/features/profile/presentation/widgets/circular_network_image.dart';
import 'package:elwekala/features/profile/presentation/widgets/edit_profile_dialog.dart';
import 'package:elwekala/features/profile/presentation/widgets/profile_title_section.dart';
import 'package:elwekala/features/profile/presentation/controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileHeaderSection extends StatelessWidget {
  final UserEntity user;

  const ProfileHeaderSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTitleSection(title: AppStrings.profile),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(20.w),
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
          child: Row(
            children: [
              CircularNetworkImage(imageUrl: user.profileImage, size: 50),
              SizedBox(width: 16.w),
              Expanded(
                child: _ProfileHeaderInfo(
                  name: user.name,
                  bio: 'FEEL THE PAIN',
                ),
              ),
              IconButton(
                onPressed: () {
                  final profileCubit = context.read<ProfileCubit>();
                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: profileCubit,
                      child: EditProfileDialog(user: user),
                    ),
                  );
                },
                icon: const Icon(FontAwesomeIcons.penToSquare),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileHeaderInfo extends StatelessWidget {
  const _ProfileHeaderInfo({required this.name, required this.bio});
  final String name;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 1,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          bio,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
