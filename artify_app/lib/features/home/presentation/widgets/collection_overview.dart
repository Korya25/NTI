import 'package:artify_app/features/home/presentation/widgets/banner_section.dart';
import 'package:artify_app/features/home/presentation/widgets/dateail_section.dart';
import 'package:artify_app/features/home/presentation/widgets/watch_list_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CollectionOverview extends StatelessWidget {
  const CollectionOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BannerSection(),
        Gap(8),
        DetailsSection(),
        Gap(16),
        WatchlistSection(),
      ],
    );
  }
}
