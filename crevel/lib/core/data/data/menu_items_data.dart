import 'package:crevel/core/constants/app_strings.dart';
import 'package:crevel/core/data/models/app_drawer_menu_item_model.dart';
import 'package:crevel/core/resources/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MenuItemsData {
  static List<AppDrawerMenuItemModel> getMenuList(BuildContext context) {
    final List<String> menuItems = AppStrings.menuItems;

    final homeItem = AppDrawerMenuItemModel(
      index: 0,
      title: menuItems[0],
      icon: CupertinoIcons.house_fill,
      onTap: () async => context.go(AppRoutes.home),
    );

    final List<AppDrawerMenuItemModel> otherItems = [
      AppDrawerMenuItemModel(
        index: 1,
        title: menuItems[1],
        icon: CupertinoIcons.wrench_fill,
        onTap: () async => context.go(AppRoutes.services),
      ),
      AppDrawerMenuItemModel(
        index: 2,
        title: menuItems[2],
        icon: CupertinoIcons.briefcase_fill,
        onTap: () async => context.go(AppRoutes.portfolio),
      ),
      AppDrawerMenuItemModel(
        index: 3,
        title: menuItems[3],
        icon: CupertinoIcons.info_circle_fill,
        onTap: () async => context.go(AppRoutes.about),
      ),
      AppDrawerMenuItemModel(
        index: 4,
        title: menuItems[4],
        icon: CupertinoIcons.news_solid,
        onTap: () async => context.go(AppRoutes.news),
      ),
      AppDrawerMenuItemModel(
        index: 5,
        title: menuItems[5],
        icon: CupertinoIcons.book_fill,
        onTap: () async => context.go(AppRoutes.blog),
      ),
      AppDrawerMenuItemModel(
        index: 6,
        title: menuItems[6],
        icon: CupertinoIcons.phone_fill,
        onTap: () async => context.go(AppRoutes.contact),
      ),
    ];

    otherItems.sort((a, b) => a.title.length.compareTo(b.title.length));

    return [homeItem, ...otherItems];
  }
}
