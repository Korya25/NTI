import 'dart:io';

import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/core/utils/app_dialogs.dart';
import 'package:elwekala/core/widgets/custom_button.dart';
import 'package:elwekala/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:elwekala/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.selectedGender,
    required this.selectedImage,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.nameController,
    required this.nationalIdController,
  });

  final GlobalKey<FormState> formKey;
  final String? selectedGender;
  final File? selectedImage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final TextEditingController nationalIdController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          AppDialogs.showError(context, state.message);
        } else if (state is AuthSuccess) {
          context.go(AppRoutes.home);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: AppStrings.signUp,
          isLoading: state is AuthLoading,
          onPressed: () {
            if (!_isFormCompletelyValid(context)) return;

            context.read<AuthCubit>().register(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              phone: phoneController.text.trim(),
              nationalId: nationalIdController.text.trim(),
              gender: selectedGender!,
              password: passwordController.text,
              profileImage: ApiKeys.testProileImage,
            );
          },
        );
      },
    );
  }

  bool _isFormCompletelyValid(BuildContext context) {
    if (!formKey.currentState!.validate()) return false;

    final controllers = [
      nameController,
      emailController,
      phoneController,
      nationalIdController,
      passwordController,
    ];

    for (var controller in controllers) {
      if (controller.text.trim().isEmpty) {
        AppDialogs.showError(context, AppStrings.fieldRequired);
        return false;
      }
    }

    if (selectedGender == null) {
      AppDialogs.showError(context, AppStrings.errorSelectGender);
      return false;
    }

    if (selectedImage == null) {
      AppDialogs.showError(context, AppStrings.errorSelectImage);
      return false;
    }

    return true;
  }
}
