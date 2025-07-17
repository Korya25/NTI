// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:counter_app/core/constants/app_text_styles.dart';
import 'package:counter_app/core/constants/app_strings.dart';
import 'package:counter_app/features/zikr/controller/zikr_cubit.dart';

class CustomDrawerListTile extends StatelessWidget {
  const CustomDrawerListTile({
    super.key,
    required this.cubit,
    required this.text,
  });

  final ZikrCubit cubit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          Icons.bookmark_outline,
          color: Colors.green.shade600,
        ),
        title: Text(
          text,
          style: AppTextStyles.cairo20Black.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.green.shade400,
        ),
        onTap: () {
          cubit.changeZikr(text);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${AppStrings.changeMessageSucess} $text'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}