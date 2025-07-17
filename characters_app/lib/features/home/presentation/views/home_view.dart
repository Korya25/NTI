import 'package:characters_app/core/theme/app_text_style.dart';
import 'package:characters_app/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters',
          style: AppTextStyle.char,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: CustomGridView());
  }
}
