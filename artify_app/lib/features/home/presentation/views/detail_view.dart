import 'package:artify_app/core/const/app_string.dart';
import 'package:artify_app/features/home/presentation/widgets/custom_devider_widget.dart';
import 'package:artify_app/features/home/presentation/widgets/detail_header.dart';
import 'package:artify_app/features/home/presentation/widgets/product_componnent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              children: [
                Gap(40.h),
                DetailHeader(title: AppString.detail),
                Gap(30.h),
                DetailViewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailViewBody extends StatelessWidget {
  const DetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProductImage(),
        Gap(16),
        ProductId(),
        Gap(12),
        NameAndIcon(),
        Gap(12),
        SoldAndTimer(),
        DividerWidget(),
        DescriptionTitle(),
        Gap(8),
        DescriptionText(),
        Gap(16),
        PriceAndBid(),
        Gap(30),
      ],
    );
  }
}
