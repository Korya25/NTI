import 'package:flutter/material.dart';
import 'package:elwekala/core/constants/app_colors.dart';

class ClearFiltersButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearFiltersButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.cleaning_services_outlined),
      label: const Text('Clear'),
      style: TextButton.styleFrom(foregroundColor: AppColors.errorColor),
    );
  }
}

class ApplyFiltersButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ApplyFiltersButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.done_all_outlined),
      label: const Text('Apply'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}