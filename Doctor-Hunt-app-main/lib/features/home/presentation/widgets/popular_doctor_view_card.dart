import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_rating_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorViewCard extends StatelessWidget {
  const PopularDoctorViewCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.h,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 110.h,
        decoration: _buildCardDecoration(),
        child: Stack(
          children: [
            Row(
              spacing: 12.w,
              children: [
                SizedBox(
                  width: 85.w,
                  height: 85.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImageWithShimmer(
                      imageUrl: doctor.image,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 3.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        doctor.name,
                        style: AppTextStyles.rubik16MediumPrimary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        doctor.category,
                        style: AppTextStyles.rubik14LightTertiary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      _buildRatingSection(),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: FavoriteButton(height: 17.h),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(8.r),
    );
  }

  Widget _buildRatingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRatingBar(rating: doctor.rating),
        Row(
          spacing: 4.w,
          children: [
            Text(
              doctor.rating.toString(),
              style: AppTextStyles.rubik16MediumPrimary,
            ),
            Text(
              '(${doctor.ratingCount})',
              style: AppTextStyles.rubik16RegularTertiary,
            ),
          ],
        ),
      ],
    );
  }
}
