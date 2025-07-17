import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/models/fake_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCommentCard extends StatelessWidget {
  const ChatCommentCard({
    super.key,
    required this.fakeUser,
    required this.message,
  });

  final FakeUser fakeUser;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.bottom16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedNetworkImageWithShimmer(imageUrl: fakeUser.imageUrl),
          ),
          SizedBox(width: 12.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fakeUser.name,
                  style: AppTextStyles.rubik18MediumSecondary,
                ),
                SizedBox(height: 4.h),
                Text(
                  message,
                  maxLines: 3,
                  style: AppTextStyles.rubik14LightSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
