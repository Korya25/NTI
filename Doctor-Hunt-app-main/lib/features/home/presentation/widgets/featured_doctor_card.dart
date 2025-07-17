import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FeaturedDoctorCard extends StatelessWidget {
  const FeaturedDoctorCard({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Material(
          elevation: 10,
          child: SizedBox(
            width: 120.w,
            child: Padding(
              padding: AppPadding.h10v10,
              child: Column(
                spacing: 10.h,
                children: [
                  // Heart & rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FavoriteButton(),
                      Row(
                        spacing: 5.w,
                        children: [
                          SvgPicture.asset(
                            AppIconsSvgs.star,
                            height: 13,
                            width: 13,
                          ),
                          Text(
                            doctorModel.rating.toString(),
                            style: AppTextStyles.rubik10BoldPrimary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Image
                  Flexible(
                    child: SizedBox(
                      height: 60.h,
                      width: 60.h,
                      child: ClipOval(
                        child: CachedNetworkImageWithShimmer(
                          imageUrl: doctorModel.image,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      // Name
                      Text(
                        doctorModel.name,
                        style: AppTextStyles.rubik12MediumPrimary,
                      ),

                      // price of Hour
                      Text(
                        '${doctorModel.price}/ hours',
                        style: AppTextStyles.rubik9LightTertiary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
