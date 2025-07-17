import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppDialogs {
  static void showError(BuildContext context, String message) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red.shade600,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
