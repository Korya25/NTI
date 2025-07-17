import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/presentation/widgets/blurred_circle.dart';
import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget body;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar ?? const SizedBox(),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-1.3, -1.2),
            child: CustomBlurredCircle(color: AppColors.topBackgroundContainer),
          ),
          Align(
            alignment: const Alignment(1.2, 1.2),
            child: CustomBlurredCircle(
              color: AppColors.bottomBackgroundContainer,
            ),
          ),

          body,
        ],
      ),
    );
  }
}
