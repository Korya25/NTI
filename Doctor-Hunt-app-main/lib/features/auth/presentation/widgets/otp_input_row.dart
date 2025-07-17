import 'package:doctor_hunt/features/auth/presentation/widgets/otp_input_field_widget.dart';
import 'package:flutter/material.dart';

class OtpInputRow extends StatefulWidget {
  const OtpInputRow({super.key, required this.controllers, this.onCompleted});

  final List<TextEditingController> controllers;
  final ValueChanged<String>? onCompleted;

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return OtpInputField(
          controller: widget.controllers[index],
          focusNode: _focusNodes[index],
          nextFocusNode: index < 3 ? _focusNodes[index + 1] : null,
          onChanged: (value) => _onFieldChanged(),
        );
      }),
    );
  }

  void _onFieldChanged() {
    final otpCode = widget.controllers.map((c) => c.text).join();
    if (otpCode.length == 4) {
      widget.onCompleted?.call(otpCode);
    }
  }
}
