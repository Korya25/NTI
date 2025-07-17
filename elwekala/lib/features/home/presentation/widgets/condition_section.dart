import 'package:flutter/material.dart';
import 'package:elwekala/core/constants/app_colors.dart';

class ConditionSectionHeader extends StatelessWidget {
  const ConditionSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.category_outlined, size: 20, color: AppColors.primaryColor),
        const SizedBox(width: 8),
        Text(
          'Condition',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}

class ConditionCards extends StatelessWidget {
  final String? selectedStatus;
  final Function(String?) onStatusChanged;

  const ConditionCards({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildConditionCard(
            'New', 
            Icons.new_releases_outlined,
            selectedStatus == 'New',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildConditionCard(
            'Used', 
            Icons.history_toggle_off_outlined,
            selectedStatus == 'Used',
          ),
        ),
      ],
    );
  }

  Widget _buildConditionCard(String status, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () => onStatusChanged(isSelected ? null : status),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              // ignore: deprecated_member_use
              ? AppColors.primaryColor.withOpacity(0.1)
              : AppColors.surfaceColor,
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.borderColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.iconColor,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              status,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primaryColor : AppColors.primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}