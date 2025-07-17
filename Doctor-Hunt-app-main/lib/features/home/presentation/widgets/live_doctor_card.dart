import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/transform_animated_widget.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LiveDoctorCard extends StatelessWidget {
  const LiveDoctorCard({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImageWithShimmer(imageUrl: doctorModel.image),
            // Play Icon
            TransformAnimatedWidget(
              child: SvgPicture.asset(
                AppIconsSvgs.playVideo,
                fit: BoxFit.scaleDown,
              ),
            ),

            // Live Icon
            Align(
              alignment: Alignment.topRight,
              child: CustomFadeIn(
                direction: FadeDirection.left,

                child: SvgPicture.asset(
                  AppIconsSvgs.live,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
