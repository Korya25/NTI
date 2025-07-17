import 'package:artify_app/features/home/presentation/widgets/items_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionTabView extends StatelessWidget {
  const CollectionTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      child: const TabBarView(
        children: [ItemsGrid(), Center(child: Text("No activity yet"))],
      ),
    );
  }
}
