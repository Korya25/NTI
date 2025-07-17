import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/utils/function.dart';
import 'package:doctor_hunt/core/utils/validators.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/agree_terms.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Name field
          CustomFadeIn(
            direction: FadeDirection.right,
            child: AuthTextFormFieldWidget(
              hintText: AppString.name,
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              validator: Validators.validateName,
            ),
          ),

          // Email field
          CustomFadeIn(
            direction: FadeDirection.left,
            child: EmailField(emailController: _emailController),
          ),

          // Password field
          CustomFadeIn(
            direction: FadeDirection.right,
            child: PasswordField(controller: _passwordController),
          ),

          // Agree terms
          CustomFadeIn(
            direction: FadeDirection.left,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: AgreeTerms(isChecked: isChecked),
            ),
          ),

          // Sign up button
          CustomFadeIn(
            direction: FadeDirection.right,
            child: CustomButtom(
              height: 60.h,
              title: AppString.signUp,
              onTap: () => handleSignup(
                context: context,
                formKey: _formKey,
                isChecked: isChecked,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
