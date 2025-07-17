import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_buttom.dart';
import 'package:doctor_hunt/core/utils/function.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomFadeIn(
            direction: FadeDirection.right,
            child: EmailField(emailController: _emailController),
          ),
          CustomFadeIn(
            direction: FadeDirection.left,
            child: PasswordField(controller: _passwordController),
          ),
          CustomFadeIn(
            direction: FadeDirection.right,
            child: CustomButtom(
              height: 60.h,
              title: AppString.login,
              onTap: () => handleLogin(context: context, formKey: _formKey),
            ),
          ),
        ],
      ),
    );
  }
}
