import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingButtom extends StatelessWidget {
  const OnboardingButtom({
    super.key,
    required this.getStartedOnTap,
    required this.nextOnTap,
    required this.disableNextOnTap,
  });
  final VoidCallback getStartedOnTap;
  final VoidCallback nextOnTap;
  final bool disableNextOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtom(
          onTap: getStartedOnTap,
          height: 54.h,
          width: 300.w,
          title: AppString.getStarted,
        ),

        // Skip Text Button
        Visibility(
          visible: !disableNextOnTap,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: TextButton(
            onPressed: nextOnTap,
            child: Text(
              AppString.next,
              style: AppTextStyles.rubik14MediumTertiary,
            ),
          ),
        ),
        /*Opacity(
          opacity: disableNextOnTap ? 0.0 : 1.0,
          child: AbsorbPointer(
            absorbing: disableNextOnTap,
            child: TextButton(
              onPressed: nextOnTap,
              child: Text(AppString.next, style: AppTextStyles.textButton),
            ),
          ),
        ),*/
      ],
    );
  }
}
