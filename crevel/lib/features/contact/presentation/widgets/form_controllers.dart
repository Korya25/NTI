import 'package:flutter/material.dart';

class FormControllers {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  void clear() {
    firstName.clear();
    lastName.clear();
    phone.clear();
    email.clear();
    message.clear();
  }

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    phone.dispose();
    email.dispose();
    message.dispose();
  }
}
