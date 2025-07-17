
import 'package:characters_app/core/theme/app_text_style.dart';
import 'package:characters_app/features/home/model/char_model.dart';
import 'package:flutter/material.dart';

class CustomCharText extends StatelessWidget {
  const CustomCharText({super.key, required this.char});

  final CharModel char;

  @override
  Widget build(BuildContext context) {
    return Text(char.char, style: AppTextStyle.char);
  }
}
