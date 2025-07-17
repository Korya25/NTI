import 'package:crevel/core/data/data/menu_items_data.dart';
import 'package:crevel/core/presentation/widgets/app_drawer.dart';
import 'package:crevel/core/presentation/widgets/app_background_widget.dart';
import 'package:crevel/core/presentation/widgets/custom_container_action_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainShell extends StatefulWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final ZoomDrawerController drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      controller: drawerController,
      mainScreen: Scaffold(
        body: Stack(
          children: [
            widget.child,
            const AppBackgroundWidget(showWave: false),
            Positioned(
              top: 40.h,
              left: 20.w,
              child: CustomContainerActionIcon(
                onTap: () {
                  drawerController.toggle?.call();
                },
                icon: FontAwesomeIcons.bars,
              ),
            ),
          ],
        ),
      ),
      menuItems: MenuItemsData.getMenuList(context),
    );
  }
}

