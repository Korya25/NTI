
import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AgeWeightSelector extends StatelessWidget {
  final String title;
  final int value;
  final String unit;
  final Function(int) onChanged;

  const AgeWeightSelector({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading3),
          SizedBox(height: 16),
          Text(
            '$value',
            style: AppTextStyles.bmiNumber.copyWith(fontSize: 32),
          ),
          Text(unit, style: AppTextStyles.caption),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                icon: Icons.remove,
                onPressed: () {
                  if (value > 1) {
                    onChanged(value - 1);
                  }
                },
              ),
              _buildButton(
                icon: Icons.add,
                onPressed: () {
                  onChanged(value + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.onPrimary),
        iconSize: 24,
      ),
    );
  }
}