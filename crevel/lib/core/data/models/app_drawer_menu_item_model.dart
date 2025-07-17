import 'package:flutter/material.dart';

class AppDrawerMenuItemModel {
  final String title;
  final IconData icon;
  final int index;
  final Future<void> Function()? onTap;
  final bool isLogout;

  AppDrawerMenuItemModel({
    required this.title,
    required this.icon,
    required this.index,
    this.onTap,
    this.isLogout = false,
  });
}
