import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/core/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:elwekala/core/widgets/custom_button.dart';
import 'package:elwekala/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:elwekala/features/auth/presentation/controllers/auth_state.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

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
          text: AppStrings.login,
          isLoading: state is AuthLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().login(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            }
          },
        );
      },
    );
  }
}
