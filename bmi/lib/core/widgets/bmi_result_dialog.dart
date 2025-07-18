
import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class BMIResultDialog extends StatelessWidget {
  final double bmi;
  final String gender;
  final int age;
  final int weight;
  final int height;

  const BMIResultDialog({
    super.key,
    required this.bmi,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
  });

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return AppColors.info;
    } else if (bmi < 25) {
      return AppColors.success;
    } else if (bmi < 30) {
      return AppColors.warning;
    } else {
      return AppColors.error;
    }
  }

  String _getBMIAdvice(double bmi) {
    if (bmi < 18.5) {
      return 'You may need to gain weight. Consider consulting a healthcare provider.';
    } else if (bmi < 25) {
      return 'Great! You have a healthy weight. Keep maintaining your current lifestyle.';
    } else if (bmi < 30) {
      return 'You may need to lose some weight. Consider a balanced diet and regular exercise.';
    } else {
      return 'You should consider losing weight. Please consult a healthcare provider.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = _getBMICategory(bmi);
    final color = _getBMIColor(bmi);
    final advice = _getBMIAdvice(bmi);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.health_and_safety,
              size: 64,
              color: color,
            ),
            SizedBox(height: 16),
            Text(
              'Your BMI Result',
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(1),
              style: AppTextStyles.bmiNumber.copyWith(color: color),
            ),
            SizedBox(height: 8),
            Text(
              category,
              style: AppTextStyles.bmiCategory.copyWith(color: color),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text('Your Information:', style: AppTextStyles.label),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender:', style: AppTextStyles.bodySmall),
                      Text(gender, style: AppTextStyles.bodySmall),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age:', style: AppTextStyles.bodySmall),
                      Text('$age years', style: AppTextStyles.bodySmall),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Height:', style: AppTextStyles.bodySmall),
                      Text('$height cm', style: AppTextStyles.bodySmall),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weight:', style: AppTextStyles.bodySmall),
                      Text('$weight kg', style: AppTextStyles.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              advice,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Recalculate', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('OK', style: AppTextStyles.button),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}