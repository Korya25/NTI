import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatefulWidget {
  final Widget child;
  final String location;

  const MainShell({super.key, required this.child, required this.location});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static const routeIndexMap = {
    '/home': 0,
    '/favorites': 1,
    '/book': 2,
    '/messages': 3,
  };

  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = _calculateCurrentIndex();
  }

  @override
  void didUpdateWidget(covariant MainShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      setState(() {
        _currentIndex = _calculateCurrentIndex();
      });
    }
  }

  int _calculateCurrentIndex() {
    return routeIndexMap.entries
        .firstWhere(
          (e) => widget.location.startsWith(e.key),
          orElse: () => const MapEntry('/home', 0),
        )
        .value;
  }

  void _onTap(int index) {
    if (index == _currentIndex) return;
    final route = routeIndexMap.entries.firstWhere((e) => e.value == index).key;
    GoRouter.of(context).go(route);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: widget.child,
      bottomNavigationBar: CustomFadeIn(
        direction: FadeDirection.up,
        child: CustomBottomNavBar(currentIndex: _currentIndex, onTap: _onTap),
      ),
    );
  }
}
