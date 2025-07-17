import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/data/models/app_drawer_menu_item_model.dart';
import 'package:crevel/core/presentation/widgets/menu_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatefulWidget {
  final Widget mainScreen;
  final List<AppDrawerMenuItemModel> menuItems;
  final ZoomDrawerController controller;

  const AppDrawer({
    super.key,
    required this.mainScreen,
    required this.menuItems,
    required this.controller,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int _selectedIndex = 0;
  bool _isNavigating = false;

  void _onItemSelected(int index) {
    if (_isNavigating) return;

    setState(() {
      _selectedIndex = index;
      _isNavigating = true;
    });

    widget.controller.close?.call();

    // إعادة تعيين _isNavigating بعد فترة قصيرة
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isNavigating = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final drawerWidth = 0.7.sw;

    return ZoomDrawer(
      controller: widget.controller,
      menuBackgroundColor: AppColors.main,
      shadowLayer1Color: AppColors.primaryIcon,
      shadowLayer2Color: AppColors.thirdIcon,
      borderRadius: 32.r,
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      angle: -8,
      drawerShadowsBackgroundColor: AppColors.thirdIcon,
      slideWidth: drawerWidth > 800.w ? 800.w : drawerWidth,
      menuScreen: MenuScreen(
        menuItems: widget.menuItems,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      mainScreen: widget.mainScreen,
    );
  }
}
