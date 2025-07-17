
import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: AppIconSvgs.home, label: 'Home'),
      _NavItem(icon: AppIconSvgs.search, label: 'Search'),
      _NavItem(icon: AppIconSvgs.save, label: 'save'),
      _NavItem(icon: AppIconSvgs.person, label: 'Profile'),
    ];

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: const Color.fromARGB(186, 255, 255, 255),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: SvgPicture.asset(
              items[index].icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                index == selectedIndex ? Colors.black : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String label;

  _NavItem({required this.icon, required this.label});
}
