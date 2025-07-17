// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDialog {
  static void showContactDialog({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onAction,
    required String actionLabel,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.main,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.primaryText.withOpacity(0.3)),
          ),
          title: Row(
            children: [
              Icon(icon, color: AppColors.primaryText, size: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style: AppTextStyles.roboto18Secondary500,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.homeSection,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryText.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        style: AppTextStyles.roboto16Secondary600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: value));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Copied to clipboard'),
                            backgroundColor: AppColors.primaryText,
                          ),
                        );
                      },
                      icon: Icon(Icons.copy, color: AppColors.primaryText, size: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: AppTextStyles.roboto14Secondary400,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onAction();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryText,
                foregroundColor: AppColors.main,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                actionLabel,
                style: AppTextStyles.roboto14Primary600.copyWith(color: AppColors.main),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showLocationDialog({
    required BuildContext context,
    required String office,
    required String address,
    required double? latitude,
    required double? longitude,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.main,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.primaryText.withOpacity(0.3)),
          ),
          title: Row(
            children: [
              Icon(Icons.location_on, color: AppColors.primaryText, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  office,
                  style: AppTextStyles.roboto18Secondary500,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.homeSection,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryText.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        address,
                        style: AppTextStyles.roboto16Secondary600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: address));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Address copied to clipboard'),
                            backgroundColor: AppColors.primaryText,
                          ),
                        );
                      },
                      icon: Icon(Icons.copy, color: AppColors.primaryText, size: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: AppTextStyles.roboto14Secondary400,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _openMaps(address, latitude, longitude);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryText,
                foregroundColor: AppColors.main,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Open Maps',
                style: AppTextStyles.roboto14Primary600.copyWith(color: AppColors.main),
              ),
            ),
          ],
        );
      },
    );
  }

  static void _openMaps(String address, double? latitude, double? longitude) async {
    String url;
    if (latitude != null && longitude != null) {
      url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    } else {
      url = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';
    }
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}