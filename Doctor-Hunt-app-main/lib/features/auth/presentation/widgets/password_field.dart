import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/utils/validators.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.title,
    this.validator,
  });
  final TextEditingController controller;
  final String? title;
  final String? Function(String?)? validator;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormFieldWidget(
      hintText: widget.title ?? AppString.password,
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator ?? Validators.validatePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
