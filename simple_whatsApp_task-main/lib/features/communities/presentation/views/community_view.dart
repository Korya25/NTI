import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/app_strings.dart';
import 'package:simple_whats_app/core/constants/text_styles.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.community)),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.groups, size: 40, color: AppColors.accent),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stay connected with your community',
                        style: TextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Communities bring related groups together',
                        style: TextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Your Communities', style: TextStyles.bodySmall),
          const SizedBox(height: 8),
          ..._dummyCommunities(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.groups, color: AppColors.textLight),
        onPressed: () {},
      ),
    );
  }

  List<Widget> _dummyCommunities() {
    final data = [
      {
        'name': 'Flutter Devs',
        'desc': 'Discuss updates, code, and meetups',
        'image': 'https://avatars.githubusercontent.com/u/14101776?s=200',
      },
      {
        'name': 'Gym Squad',
        'desc': 'Workout tips and motivation',
        'image': 'https://randomuser.me/api/portraits/men/33.jpg',
      },
    ];

    return data
        .map(
          (community) => ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(community['image']!),
            ),
            title: Text(community['name']!, style: TextStyles.bodyMedium),
            subtitle: Text(community['desc']!, style: TextStyles.bodySmall),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        )
        .toList();
  }
}
