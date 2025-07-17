import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/presentation/controllers/get_laptops_cubit.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_product.dart';
import 'package:elwekala/features/home/presentation/widgets/home_search_bar.dart';
import 'package:elwekala/features/home/presentation/widgets/sliver_grid_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaptopSuccessBody extends StatelessWidget {
  final List<Product> products;
  final TextEditingController searchController;

  const LaptopSuccessBody({
    super.key,
    required this.products,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: HomeSearchBar(
            searchController: searchController,
            onChanged: (query) {
              context.read<GetLaptopsCubit>().filterLaptops(
                ProductFilterOptions().copyWith(name: query),
              );
            },
            onFilterApplied: (filterOptions) {
              context.read<GetLaptopsCubit>().filterLaptops(
                ProductFilterOptions().copyWith(
                  status: filterOptions.status,
                  maxPrice: filterOptions.maxPrice,
                  minPrice: filterOptions.minPrice,
                ),
              );
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Text(
            ' ${products.length} results',
            style: TextStyle(fontSize: 20, color: AppColors.secondaryTextColor),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        SliverGridProducts(products: products),
      ],
    );
  }
}
