import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/utils/function.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/bottom_sheet_container.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/email_field.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/reusable_bottom_sheet_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  State<ForgotPasswordBottomSheet> createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetContainer(
      child: ReusableBottomSheetForm(
        formKey: _formKey,
        title: AppString.forgotPassword,
        subtitle: AppString.forgotPasswordTitle,
        fields: [EmailField(emailController: _emailController)],
        buttonTitle: AppString.continueText,
        onButtonPressed: () => handleContinueForgotPass(
          context: context,
          formKey: _formKey,
          emailController: _emailController,
        ),
      ),
    );
  }
}
