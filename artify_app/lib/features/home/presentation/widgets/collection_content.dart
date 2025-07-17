import 'package:artify_app/features/home/presentation/widgets/collection_overview.dart';
import 'package:artify_app/features/home/presentation/widgets/collection_tab_bar.dart';
import 'package:artify_app/features/home/presentation/widgets/collection_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CollectionContent extends StatelessWidget {
  const CollectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          CollectionOverview(),
          Gap(24),
          CollectionTabBar(),
          Gap(24),
          CollectionTabView(),
        ],
      ),
    );
  }
}
