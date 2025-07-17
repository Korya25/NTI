import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/data/models/app_drawer_menu_item_model.dart';
import 'package:crevel/core/presentation/widgets/app_drawer_menu_item_widget.dart';
import 'package:crevel/core/presentation/widgets/animated_star.dart';
import 'package:crevel/core/presentation/widgets/menu_constant.dart';
import 'package:crevel/core/presentation/widgets/star_decoration.dart';
import 'package:crevel/features/contact/presentation/widgets/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScreen extends StatefulWidget {
  final List<AppDrawerMenuItemModel> menuItems;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const MenuScreen({
    super.key,
    required this.menuItems,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Stack(children: [_buildMainContent(), StarDecoration()]),
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedStar(size: 1.sw * MenuConstants.starSizeFactor),
          SizedBox(height: MenuConstants.smallSpacingFactor.h),
          SizedBox(height: MenuConstants.smallSpacingFactor.h),
          _buildMenuItems(),
          SizedBox(height: MenuConstants.smallSpacingFactor.h),

          _buildLanguageSelector(),
          AnimatedStar(size: 1.sw * MenuConstants.starSizeFactor),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: widget.menuItems
          .map(
            (item) => AppDrawerMenuItemWidget(
              title: item.title,
              icon: item.icon,
              isSelected: widget.selectedIndex == item.index,
              onTap: () => _handleMenuItemTap(item),
            ),
          )
          .toList(),
    );
  }

  Widget _buildLanguageSelector() {
    return CustomDropdownField(
      value: _selectedLanguage,
      items: MenuConstants.languageOptions,
      hintText: MenuConstants.languageHint,
      onChanged: _handleLanguageChange,
      backgroundColor: AppColors.main,
      borderColor: AppColors.main,
      dropdownColor: AppColors.main,
      textColor: AppColors.primaryIcon,
      hintColor: Colors.blue[200],
      iconColor: AppColors.primaryIcon,
      selectedItemColor: AppColors.primaryIcon,
      borderWidth: MenuConstants.borderWidth,
      borderRadius: MenuConstants.borderRadius,
    );
  }

  Future<void> _handleMenuItemTap(AppDrawerMenuItemModel item) async {
    await ZoomDrawer.of(context)?.close();
    widget.onItemSelected(item.index);
    await item.onTap?.call();
  }

  void _handleLanguageChange(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedLanguage = newValue;
      });
    }
  }
}
