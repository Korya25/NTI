// ignore_for_file: deprecated_member_use

import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/product_model.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavorite = false;
  String selectedSize = 'M';
  int selectedColorIndex = 0;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 400,
                  pinned: true,
                  backgroundColor: AppColors.background,
                  iconTheme: const IconThemeData(color: AppColors.white),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
  Uri.encodeFull(widget.product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.title,
                                    style: AppTextStyle.subheads,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.product.category,
                                    style: AppTextStyle.descriptiveItems.copyWith(color: AppColors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              widget.product.price.toStringAsFixed(2),
                              style: AppTextStyle.subheads.copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < widget.product.rating.floor()
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 20,
                                );
                              }),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '(${widget.product.rating})',
                              style: AppTextStyle.descriptionText.copyWith(color: AppColors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text('Size', style: AppTextStyle.descriptiveItems.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 12),
                        Row(
                          children: sizes.map((size) {
                            return GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedSize == size ? AppColors.primary : AppColors.dark,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: selectedSize == size
                                        ? AppColors.primary
                                        : AppColors.grey.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  size,
                                  style: AppTextStyle.descriptiveItems.copyWith(
                                    color: selectedSize == size
                                        ? AppColors.white
                                        : AppColors.ordinaryText,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text('Color', style: AppTextStyle.descriptiveItems.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 12),
                        Row(
                          children: List.generate(colors.length, (index) {
                            final color = colors[index];
                            final isSelected = selectedColorIndex == index;
                            return GestureDetector(
                              onTap: () => setState(() => selectedColorIndex = index),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? AppColors.primary : AppColors.grey.withOpacity(0.3),
                                    width: isSelected ? 2 : 1,
                                  ),
                                ),
                                child: isSelected
                                    ? const Icon(Icons.check, color: AppColors.white, size: 20)
                                    : null,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.product.description,
                          style: AppTextStyle.descriptiveItems.copyWith(color: AppColors.grey, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: AppColors.dark),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => isFavorite = !isFavorite),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? AppColors.primary : AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
  text: 'ADD TO CART',
  onPressed: () {
    Navigator.pop(context);

    context.read<ProductCubit>().addToCart(widget.product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to cart successfully!', style: AppTextStyle.descriptiveItems),
        backgroundColor: AppColors.success,
      ),
    );
  },
),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
