import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/features/auth/presentation/widgets/signup_form.dart';
import 'package:elwekala/features/auth/presentation/widgets/auth_header_message.dart';
import 'package:elwekala/features/auth/presentation/widgets/auth_footer_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 60.h,
              bottom: 20.h,
            ),
            child: _RegisterScreenBody(),
          ),
        ),
      ),
    );
  }
}

class _RegisterScreenBody extends StatelessWidget {
  const _RegisterScreenBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthHeaderMessage(
          title: AppStrings.createAccount,
          subtitle: AppStrings.registerSubtitle,
        ),
        SizedBox(height: 30.h),
        SignupForm(),
        SizedBox(height: 20.h),
        AuthFooterAction(
          question: AppStrings.alreadyHaveAccount,
          actionText: AppStrings.login,
          onPressed: () => context.go(AppRoutes.login),
        ),
      ],
    );
  }
}
