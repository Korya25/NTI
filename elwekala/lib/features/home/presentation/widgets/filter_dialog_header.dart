import 'package:flutter/material.dart';
import 'package:elwekala/core/constants/app_colors.dart';

class FilterDialogHeader extends StatelessWidget {
  const FilterDialogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.filter_alt_outlined, 
                color: AppColors.primaryColor, size: 24),
          ),
          const SizedBox(width: 12),
          Text(
            'Filter Options',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}