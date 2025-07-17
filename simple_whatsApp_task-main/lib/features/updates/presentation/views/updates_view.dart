import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_colors.dart';
import 'package:simple_whats_app/core/constants/app_strings.dart';
import 'package:simple_whats_app/core/constants/text_styles.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.updates)),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/11.jpg',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            title: const Text('My Status'),
            subtitle: const Text('Tap to add status update'),
            onTap: () {
              // Add status logic
            },
          ),
          const Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Text('Recent updates', style: TextStyles.bodySmall),
          ),
          ..._dummyStatuses(),

          const SizedBox(height: 16),
          const Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Text('Channels', style: TextStyles.bodySmall),
          ),
          ..._dummyChannels(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'camera',
            mini: true,
            backgroundColor: AppColors.lightGrey,
            child: const Icon(Icons.camera_alt, color: AppColors.textDark),
            onPressed: () {
              // Open camera
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'edit',
            backgroundColor: AppColors.accent,
            child: const Icon(Icons.edit, color: AppColors.textLight),
            onPressed: () {
              // Add status via text
            },
          ),
        ],
      ),
    );
  }

  // ----- Dummy status list -----
  List<Widget> _dummyStatuses() {
    final users = [
      {
        'name': 'Sarah',
        'image': 'https://randomuser.me/api/portraits/women/12.jpg',
        'time': 'Today, 10:00 AM',
      },
      {
        'name': 'Ahmed',
        'image': 'https://randomuser.me/api/portraits/men/14.jpg',
        'time': 'Yesterday, 8:00 PM',
      },
    ];

    return users
        .map(
          (user) => ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(user['image']!),
            ),
            title: Text(user['name']!, style: TextStyles.bodyMedium),
            subtitle: Text(user['time']!, style: TextStyles.bodySmall),
            onTap: () {
              // View status
            },
          ),
        )
        .toList();
  }

  List<Widget> _dummyChannels() {
    final channels = [
      {
        'name': 'Flutter Updates',
        'desc': 'New release: Flutter 3.22',
        'image': 'https://avatars.githubusercontent.com/u/14101776?s=200',
      },
      {
        'name': 'Tech News',
        'desc': 'AI is transforming mobile apps!',
        'image': 'https://randomuser.me/api/portraits/lego/1.jpg',
      },
    ];

    return channels
        .map(
          (channel) => ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(channel['image']!),
            ),
            title: Text(channel['name']!, style: TextStyles.bodyMedium),
            subtitle: Text(channel['desc']!, style: TextStyles.bodySmall),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Open channel
            },
          ),
        )
        .toList();
  }
}
