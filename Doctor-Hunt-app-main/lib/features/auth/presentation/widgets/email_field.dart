import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/utils/validators.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormFieldWidget(
      hintText: AppString.email,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: Validators.validateEmail,
    );
  }
}
