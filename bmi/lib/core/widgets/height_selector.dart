
import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeightSelector extends StatelessWidget {
  final int height;
  final Function(int) onHeightChanged;

  const HeightSelector({
    super.key,
    required this.height,
    required this.onHeightChanged,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Height', style: AppTextStyles.heading3),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$height',
                style: AppTextStyles.bmiNumber.copyWith(fontSize: 32),
              ),
              SizedBox(width: 8),
              Text('cm', style: AppTextStyles.bodyLarge),
            ],
          ),
          SizedBox(height: 16),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.divider,
              thumbColor: AppColors.primary,
              overlayColor: AppColors.primary.withOpacity(0.2),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 100,
              max: 250,
              divisions: 150,
              onChanged: (value) {
                onHeightChanged(value.round());
              },
            ),
          ),
        ],
      ),
    );
  }
}
