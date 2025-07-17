import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final bool showFavorites;
  final bool showCart;

  final VoidCallback? onBack;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onFavoritesPressed;
  final VoidCallback? onCartPressed;
  final VoidCallback? onToggleFavorite;

  const HomeAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.showFavorites = true,
    this.showCart = true,
    this.onBack,
    this.onProfilePressed,
    this.onFavoritesPressed,
    this.onCartPressed,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              onPressed: onBack ?? () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            )
          : _buildIcon(
              context: context,
              route: AppRoutes.profile,
              icon: Icons.person_outline,
              onPressed: onProfilePressed,
            ),
      centerTitle: true,
      title: Text(
        title ?? AppStrings.laptops,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions: [
        if (showFavorites)
          _buildIcon(
            context: context,
            route: AppRoutes.favorites,
            icon: Icons.favorite_border,
            onPressed: onFavoritesPressed,
          ),
        if (showCart)
          _buildIcon(
            context: context,
            route: AppRoutes.cart,
            icon: Icons.shopping_cart_outlined,
            onPressed: onCartPressed,
          ),
      ],
    );
  }

  Widget _buildIcon({
    required BuildContext context,
    required String route,
    required IconData icon,
    VoidCallback? onPressed,
    Color color = Colors.black,
    double size = 24,
  }) {
    return IconButton(
      onPressed: onPressed ?? () => context.pushNamed(route),
      icon: Icon(icon, color: color, size: size),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
