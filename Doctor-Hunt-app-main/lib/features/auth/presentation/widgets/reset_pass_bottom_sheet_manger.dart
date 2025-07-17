import 'package:doctor_hunt/features/auth/presentation/widgets/forgot_pass_bottom_sheet.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/otp_verification_bottom_sheet.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/reset_pass_bottom_sheet.dart';
import 'package:flutter/material.dart';

class PasswordResetBottomSheets {
  static Future<void> showForgotPassword(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return const ForgotPasswordBottomSheet();
      },
    );
  }

  static Future<void> showOtpVerification(BuildContext context, String email) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return OtpVerificationBottomSheet(email: email);
      },
    );
  }

  static Future<void> showResetPassword(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return const ResetPasswordBottomSheet();
      },
    );
  }
}

class AuthBottomSheet {
  static Future<void> showForgotPassword(BuildContext context) {
    return PasswordResetBottomSheets.showForgotPassword(context);
  }
}
