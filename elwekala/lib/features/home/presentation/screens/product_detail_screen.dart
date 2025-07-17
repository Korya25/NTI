import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/presentation/widgets/info_detail_screen.dart';
import 'package:elwekala/features/home/presentation/widgets/product_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ProductDetailScreenBody(product: product),
          ),
        ),
      ),
    );
  }
}

class _ProductDetailScreenBody extends StatelessWidget {
  final Product product;

  const _ProductDetailScreenBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImageCarousel(product: product),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: InfoDetailScreen(product: product),
        ),
      ],
    );
  }
}
