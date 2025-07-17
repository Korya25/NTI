
import 'package:flutter/material.dart';

class LaptopFailureBody extends StatelessWidget {
  final String errorMessage;

  const LaptopFailureBody({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: $errorMessage'));
  }
}
