import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/reset_pass_bottom_sheet_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void handleContinueForgotPass({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController emailController,
}) {
  if (formKey.currentState?.validate() == true) {
    Navigator.pop(context);
    PasswordResetBottomSheets.showOtpVerification(
      context,
      emailController.text,
    );
  }
}

void handleContinueOtp({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String otpCode,
}) {
  if (formKey.currentState?.validate() == true && otpCode.length == 4) {
    Navigator.pop(context);
    PasswordResetBottomSheets.showResetPassword(context);
  } else {
    showErrorMessage(context, AppString.enterValidOtp);
  }
}

void handleUpdatePassword({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
}) {
  if (formKey.currentState?.validate() == true) {
    Navigator.pop(context);
    showSuccessMessage(context, AppString.passwordUpdatedSuccessfully);
  }
}

void handleSignup({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required bool isChecked,
  required,
}) {
  if (formKey.currentState?.validate() == true) {
    if (isChecked) {
      showSuccessMessage(context, AppString.signUpSuccessfully);
      context.goNamed(AppRoutes.home);
    } else {
      showErrorMessage(context, AppString.pleaseAgreeSignUpTerms);
    }
  }
}

void handleLogin({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
}) {
  if (formKey.currentState?.validate() == true) {
    showSuccessMessage(context, AppString.loginSuccessfully);
    context.goNamed(AppRoutes.home);
  }
}

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
}

void showSuccessMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: AppColors.primaryColor),
  );
}
