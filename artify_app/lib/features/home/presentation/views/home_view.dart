import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/core/resources/app_routes.dart';
import 'package:artify_app/features/home/presentation/widgets/best_artist_card.dart';
import 'package:artify_app/features/home/presentation/widgets/category_filter.dart';
import 'package:artify_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:artify_app/features/home/presentation/widgets/header_home_title.dart';
import 'package:artify_app/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int selectedCategory = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(20.h),

              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: HeaderHomeTitle(),
              ),
              Gap(18.h),

              // Category
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CategoryFilter(
                  selectedIndex: _selectedIndex,
                  onCategorySelected: (p0) {},
                ),
              ),
              Gap(18.h),

              // Objject Card
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoutes.detail);
                },
                child: ProductCard(
                  image: AppImages.object1,
                  title: 'Hypebeast Apes',
                  timeLeft: '1h 23m 32s',
                  bid: '2.23 ETH',
                  onBidPressed: () {},
                ),
              ),
              Gap(20.h),

              // Artist
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoutes.collection);
                },
                child: const BestArtistCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
