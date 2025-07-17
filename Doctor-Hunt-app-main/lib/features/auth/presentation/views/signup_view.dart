import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/fotter_buttom.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/signup_form.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/social_buttons.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/view_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.h20v20,
            child: Column(
              children: [
                Gap(20.h),
                ViewMessage(
                  title: AppString.signUpTitle,
                  subtitle: AppString.signUpSubtitle,
                ),
                Gap(50.h),
                const SocialButtons(),
                Gap(30.h),
                const SignupForm(),
                Gap(20.h),
                CustomFadeIn(
                  direction: FadeDirection.up,
                  child: FooterButtons(
                    onTap: () => context.goNamed(AppRoutes.loginView),
                    title: AppString.haveAnAccount,
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
