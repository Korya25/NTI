
import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/app_text_styles.dart';
import 'package:bmi/core/widgets/age_weight_selector.dart';
import 'package:bmi/core/widgets/bmi_result_dialog.dart';
import 'package:bmi/core/widgets/calculate_button.dart';
import 'package:bmi/core/widgets/gender_selector.dart';
import 'package:bmi/core/widgets/height_selector.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  String selectedGender = '';
  int height = 170;
  int age = 25;
  int weight = 70;

  void _calculateBMI() {
    if (selectedGender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select your gender'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    double bmi = weight / ((height / 100) * (height / 100));
    
    showDialog(
      context: context,
      builder: (context) => BMIResultDialog(
        bmi: bmi,
        gender: selectedGender,
        age: age,
        weight: weight,
        height: height,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: AppTextStyles.heading2),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GenderSelector(
              selectedGender: selectedGender,
              onGenderSelected: (gender) {
                setState(() {
                  selectedGender = gender;
                });
              },
            ),
            SizedBox(height: 20),
            HeightSelector(
              height: height,
              onHeightChanged: (newHeight) {
                setState(() {
                  height = newHeight;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: AgeWeightSelector(
                    title: 'Age',
                    value: age,
                    unit: 'years',
                    onChanged: (newAge) {
                      setState(() {
                        age = newAge;
                      });
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AgeWeightSelector(
                    title: 'Weight',
                    value: weight,
                    unit: 'kg',
                    onChanged: (newWeight) {
                      setState(() {
                        weight = newWeight;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            CalculateButton(
              onPressed: _calculateBMI,
            ),
          ],
        ),
      ),
    );
  }
}