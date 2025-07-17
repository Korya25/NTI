import 'package:crevel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';


class AppBackgroundWidget extends StatelessWidget {
  final bool showLight;
  final bool showWave;

  const AppBackgroundWidget({
    super.key,
    this.showLight = true,
    this.showWave = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showLight)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppAssets.lightNavBar),
          ),
        if (showWave)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppAssets.wave),
          ),
       
      ],
    );
  }
}
