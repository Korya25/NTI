import 'package:artify_app/core/const/app_assets.dart';
import 'package:artify_app/features/home/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"image": AppImages.object2, "tag": "#14415", "name": "Hypebeast Apes B"},
      {"image": AppImages.object3, "tag": "#15315", "name": "Hypebeast Apes D"},
      {"image": AppImages.object4, "tag": "#22222", "name": "Hypebeast Apes A"},
      {"image": AppImages.object5, "tag": "#72277", "name": "Hypebeast Apes Z"},
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return NFTCard(
          imagePath: item['image']!,
          tag: item['tag']!,
          name: item['name']!,
        );
      },
    );
  }
}
