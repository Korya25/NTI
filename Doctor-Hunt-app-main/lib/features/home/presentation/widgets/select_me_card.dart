import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_rating_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectMeCard extends StatelessWidget {
  const SelectMeCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.all10,
      decoration: _buildCardDecoration(),
      child: Stack(
        children: [
          _buildMainContent(),
          Align(
            alignment: Alignment.topRight,
            child: FavoriteButton(height: 20.h, width: 20.w),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: AppColors.secondaryColor,
    );
  }

  Widget _buildMainContent() {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          height: 80.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: CachedNetworkImageWithShimmer(imageUrl: doctor.image),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: AppTextStyles.rubik16MediumPrimary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                doctor.category,
                style: AppTextStyles.rubik12LightTertiary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              CustomRatingBar(rating: doctor.rating),
            ],
          ),
        ),
      ],
    );
  }
}
