import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/utils/function.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/bottom_sheet_container.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/otp_input_row.dart';
import 'package:doctor_hunt/features/auth/presentation/widgets/reusable_bottom_sheet_form.dart';
import 'package:flutter/material.dart';

class OtpVerificationBottomSheet extends StatefulWidget {
  const OtpVerificationBottomSheet({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationBottomSheet> createState() =>
      _OtpVerificationBottomSheetState();
}

class _OtpVerificationBottomSheetState
    extends State<OtpVerificationBottomSheet> {
  late final List<TextEditingController> _otpControllers;
  late final GlobalKey<FormState> _formKey;
  String _otpCode = '';

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(4, (index) => TextEditingController());
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetContainer(
      child: ReusableBottomSheetForm(
        formKey: _formKey,
        title: AppString.enter4DigitCode,
        subtitle: AppString.enter4DigitCodeSubtitle,
        fields: [
          OtpInputRow(
            controllers: _otpControllers,
            onCompleted: (code) => _otpCode = code,
          ),
        ],
        buttonTitle: AppString.continueText,
        onButtonPressed: () => handleContinueOtp(
          context: context,
          formKey: _formKey,
          otpCode: _otpCode,
        ),
      ),
    );
  }
}
