import 'package:flutter/material.dart';
import 'package:simple_whats_app/core/constants/app_strings.dart';
import 'package:simple_whats_app/features/calls/presentation/views/calls_view.dart';
import 'package:simple_whats_app/features/chats/presentation/views/chats_view.dart';
import 'package:simple_whats_app/features/communities/presentation/views/community_view.dart';
import 'package:simple_whats_app/features/updates/presentation/views/updates_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ChatsPage(),
    const UpdatesPage(),
    const CommunityPage(),
    const CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: AppStrings.chats,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: AppStrings.updates,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: AppStrings.community,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: AppStrings.calls,
          ),
        ],
      ),
    );
  }
}
