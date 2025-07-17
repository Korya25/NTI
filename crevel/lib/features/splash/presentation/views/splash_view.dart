import 'package:crevel/core/presentation/widgets/app_background_widget.dart';
import 'package:crevel/core/resources/app_routes.dart';
import 'package:crevel/features/splash/presentation/widgets/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      context.goNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(children: const [AppBackgroundWidget(), SplashContent()]),
      ),
    );
  }
}
