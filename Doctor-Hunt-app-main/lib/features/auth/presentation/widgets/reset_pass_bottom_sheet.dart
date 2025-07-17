import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/utils/function.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/bottom_sheet_container.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/password_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/reusable_bottom_sheet_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  State<ResetPasswordBottomSheet> createState() =>
      _ResetPasswordBottomSheetState();
}

class _ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetContainer(
      child: SingleChildScrollView(
        child: ReusableBottomSheetForm(
          formKey: _formKey,
          title: AppString.resetPassword,
          subtitle: AppString.resetPasswordSubtitle,
          fields: [
            PasswordField(
              title: AppString.newPassword,
              controller: _passwordController,
            ),
            PasswordField(
              controller: _confirmPasswordController,
              title: AppString.reenterPassword,
              validator: _validateConfirmPassword,
            ),
          ],
          buttonTitle: AppString.updatePassword,
          onButtonPressed: () =>
              handleUpdatePassword(context: context, formKey: _formKey),
        ),
      ),
    );
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
