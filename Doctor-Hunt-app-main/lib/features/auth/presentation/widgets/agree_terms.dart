import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class AgreeTerms extends StatelessWidget {
  const AgreeTerms({super.key, required this.isChecked});
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Checkbox
        CheckBoxButton(isChecked: isChecked),

        // Text
        Text(AppString.signUpTerms, style: AppTextStyles.rubik12LightTertiary),
      ],
    );
  }
}

class CheckBoxButton extends StatelessWidget {
  const CheckBoxButton({super.key, required this.isChecked});
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      fillColor: WidgetStateProperty.all(
        isChecked ? AppColors.primaryColor : Colors.grey.withAlpha(30),
      ),
      shape: CircleBorder(),
      onChanged: null,
    );
  }
}
