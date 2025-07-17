import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/fotter_buttom.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/login_form.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/reset_pass_bottom_sheet_manger.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/social_buttons.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/view_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                const ViewMessage(
                  title: AppString.loginTitle,
                  subtitle: AppString.loginSubtitle,
                ),
                Gap(50.h),
                const SocialButtons(),
                Gap(30.h),
                const LoginForm(),
                Gap(20.h),
                CustomFadeIn(
                  direction: FadeDirection.left,
                  child: FooterButtons(
                    onTap: () => AuthBottomSheet.showForgotPassword(context),
                    title: AppString.forgotPassword,
                  ),
                ),
                Gap(130.h),
                CustomFadeIn(
                  direction: FadeDirection.up,
                  child: FooterButtons(
                    onTap: () => context.goNamed(AppRoutes.signupView),
                    title: AppString.dontHaveAccount,
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
