// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.homeSection,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: AppColors.primaryText.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          _ServiceIcon(icon: icon),
          const SizedBox(height: 24),
          _ServiceTitle(title: title),
          const SizedBox(height: 16),
          _ServiceDescription(description: description),
        ],
      ),
    );
  }
}
class _ServiceIcon extends StatelessWidget {
  final IconData icon;

  const _ServiceIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryIcon,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryIcon.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(icon, size: 40, color: Colors.white),
    );
  }
}

class _ServiceTitle extends StatelessWidget {
  final String title;

  const _ServiceTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.roboto22Secondary500,
      textAlign: TextAlign.center,
    );
  }
}

class _ServiceDescription extends StatelessWidget {
  final String description;

  const _ServiceDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.roboto16Secondary400,
      textAlign: TextAlign.center,
    );
  }
}