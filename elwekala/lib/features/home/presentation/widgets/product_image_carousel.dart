import 'package:carousel_slider/carousel_slider.dart';
import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/widgets/custom_somoth_page_indicator.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'carousel_actions.dart';

class ProductImageCarousel extends StatefulWidget {
  final Product product;

  const ProductImageCarousel({super.key, required this.product});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: Stack(
        children: [
          _buildCarousel(),
          Positioned(
            bottom: 20.h,
            left: 12.w,
            child: CustomSomothPageIndicator(
              currentIndex: _currentIndex,
              length: widget.product.images.length,
            ),
          ),
          CarouselActions(
            product: widget.product,
            onFavoritePressed: _toggleFavorite,
            onBackPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() => isFavorite = !isFavorite);
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: widget.product.images.length,
      itemBuilder: (context, index, _) {
        final imageUrl = widget.product.images[index];
        return Image.network(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.secondaryColor,
            child: const Icon(Icons.image_not_supported),
          ),
        );
      },
      options: CarouselOptions(
        height: 300.h,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        viewportFraction: 1.0,
        onPageChanged: (index, _) => setState(() => _currentIndex = index),
      ),
    );
  }
}
