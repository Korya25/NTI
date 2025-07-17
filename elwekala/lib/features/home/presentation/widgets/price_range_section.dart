import 'package:flutter/material.dart';
import 'package:elwekala/core/constants/app_colors.dart';

class PriceRangeSectionHeader extends StatelessWidget {
  const PriceRangeSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.currency_exchange_outlined, 
            size: 20, color: AppColors.primaryColor),
        const SizedBox(width: 8),
        Text(
          'Price Range',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}

class PriceRangeSlider extends StatelessWidget {
  final RangeValues priceRange;
  final double minPriceLimit;
  final double maxPriceLimit;
  final Function(RangeValues) onChanged;

  const PriceRangeSlider({
    super.key,
    required this.priceRange,
    required this.minPriceLimit,
    required this.maxPriceLimit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          RangeSlider(
            values: priceRange,
            min: minPriceLimit,
            max: maxPriceLimit,
            divisions: 20,
            labels: RangeLabels(
              '\$${priceRange.start.round()}',
              '\$${priceRange.end.round()}',
            ),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.borderColor,
            onChanged: onChanged,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${priceRange.start.round()}',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              Text(
                '\$${priceRange.end.round()}',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}