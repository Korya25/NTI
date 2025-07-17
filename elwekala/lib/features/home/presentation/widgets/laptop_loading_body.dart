import 'package:flutter/material.dart';

class LaptopLoadingBody extends StatelessWidget {
  const LaptopLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}