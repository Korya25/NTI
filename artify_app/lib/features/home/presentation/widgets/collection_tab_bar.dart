import 'package:artify_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CollectionTabBar extends StatelessWidget {
  const CollectionTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.green,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [const Tab(text: "Item’s"), const Tab(text: "Activity")],
    );
  }
}
