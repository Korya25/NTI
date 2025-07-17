import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/features/auth/presentation/widgets/login_form.dart';
import 'package:elwekala/features/auth/presentation/widgets/auth_header_message.dart';
import 'package:elwekala/features/auth/presentation/widgets/auth_footer_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: _LoginScreenBody(),
          ),
        ),
      ),
    );
  }
}

class _LoginScreenBody extends StatelessWidget {
  const _LoginScreenBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthHeaderMessage(
          title: AppStrings.loginWelcomeBack,
          subtitle: AppStrings.loginSubtitle,
        ),
        SizedBox(height: 40.h),
        LoginForm(),
        SizedBox(height: 20.h),
        AuthFooterAction(
          question: AppStrings.dontHaveAccount,
          actionText: AppStrings.signUp,
          onPressed: () => context.go(AppRoutes.register),
        ),
      ],
    );
  }
}
