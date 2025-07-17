import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/features/favorites/presentation/widgets/favorite_button.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/presentation/widgets/product_card.dart';
import 'package:elwekala/features/home/presentation/widgets/sliver_grid_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SliverGridProducts extends StatelessWidget {
  final List<Product> products;
  const SliverGridProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = products[index];
        return SliverGridAnimation(
          productIndex: index,
          child: Stack(
            children: [
              ProductCard(
                product: product,
                onTap: () =>
                    context.pushNamed(AppRoutes.productDetail, extra: product),
              ),
              Positioned(right: 10, child: FavoriteButton(product: product)),
            ],
          ),
        );
      }, childCount: products.length),
    );
  }
}
