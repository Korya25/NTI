// find_doctor_card.dart
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FindDoctorCard extends StatelessWidget {
  const FindDoctorCard({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.h,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        decoration: _buildCardDecoration(),
        padding: AppPadding.h16v14,
        child: FindDoctorCardContent(doctorModel: doctorModel),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}

class FindDoctorCardContent extends StatelessWidget {
  const FindDoctorCardContent({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          spacing: 8.h,
          children: [
            Row(
              spacing: 12.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImageWithShimmer(
                    imageUrl: doctorModel.image,
                    height: 87.h,
                    width: 92.w,
                  ),
                ),
                Expanded(child: _DoctorDetails(doctorModel: doctorModel)),
              ],
            ),
            _buildBookingSection(context),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: FavoriteButton(height: 22.h, width: 22.w),
        ),
      ],
    );
  }

  Widget _buildBookingSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.nextAvailable,
              style: AppTextStyles.rubik13MediumMainPrimary,
            ),
            Text(
              doctorModel.nextAvailable,
              style: AppTextStyles.rubik12MediumTertiary,
            ),
          ],
        ),
        CustomButtom(
          height: 45.h,
          width: 100.w,
          title: AppString.bookNow,
          textStyle: AppTextStyles.rubik12MediumSecondary,
          borderRadius: 4.r,
          onTap: () =>
              context.pushNamed(AppRoutes.selectMe, extra: doctorModel),
        ),
      ],
    );
  }
}

class _DoctorDetails extends StatelessWidget {
  const _DoctorDetails({required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorModel.name,
          style: AppTextStyles.rubik18MediumPrimary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          doctorModel.category,
          style: AppTextStyles.rubik13MediumMainPrimary,
        ),
        Text(
          '${doctorModel.yearsExperience} ${AppString.yearsExperience}',
          style: AppTextStyles.rubik12LightTertiary,
        ),
        Row(
          spacing: 20.w,
          children: [
            _buildInfoItem(icon: Icons.star, value: '${doctorModel.rating}'),
            _buildInfoItem(
              icon: Icons.people,
              value:
                  '${doctorModel.patientStories} ${AppString.patientStories}',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem({required IconData icon, required String value}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.h, color: AppColors.primaryColor),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            value,
            style: AppTextStyles.rubik12LightTertiary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
