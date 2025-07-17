import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorCard extends StatelessWidget {
  const PopularDoctorCard({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(12.r),
          color: const Color.fromARGB(240, 255, 255, 255),
          child: SizedBox(
            width: 150.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CachedNetworkImageWithShimmer(
                    imageUrl: doctorModel.image,
                  ),
                ),
                CustomFadeIn(
                  direction: FadeDirection.up,
                  child: PopularDoctorDetailCard(
                    docName: doctorModel.name,
                    docCategory: doctorModel.category,
                    docRating: doctorModel.rating,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularDoctorDetailCard extends StatelessWidget {
  const PopularDoctorDetailCard({
    super.key,
    required this.docName,
    required this.docCategory,
    required this.docRating,
  });

  final String docName;
  final String docCategory;
  final double docRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      padding: AppPadding.h8v8,
      child: Column(
        spacing: 3.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            docName,
            style: AppTextStyles.rubik15MediumPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            docCategory,
            style: AppTextStyles.rubik12LightTertiary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          CustomRatingBar(rating: docRating),
        ],
      ),
    );
  }
}
