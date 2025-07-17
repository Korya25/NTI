// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crevel/features/portfolio/data/portfolio_items.dart';
import 'package:crevel/features/portfolio/presentation/widgets/portfolio_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioCards extends StatelessWidget {
  const PortfolioCards({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = (screenHeight * 0.35).h;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: cardHeight,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            viewportFraction: 1,
          ),
          items: portfolioItems.map((item) {
            return PortfolioCard(
              title: item['title'],
              description: item['description'],
              category: item['category'],
              icon: item['icon'],
              color: item['color'],
            );
          }).toList(),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
