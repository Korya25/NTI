import 'package:elwekala/core/constants/app_strings.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (value.length < 8) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (value != password) {
      return AppStrings.passwordsNotMatch;
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    if (!value.startsWith('01')) {
      return AppStrings.phoneMustStartWith01;
    }

    if (value.length != 11) {
      return AppStrings.phoneMustBe11Digits;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return AppStrings.phoneDigitsOnly;
    }

    return null;
  }

  static String? validateNationalId(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    if (value.length < 14) {
      return AppStrings.nationalIdLengthError;
    }

    if (!RegExp(r'^\d{14}$').hasMatch(value)) {
      return AppStrings.invalidNationalId;
    }

    return null;
  }
}
