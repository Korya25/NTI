// blog_view.dart
// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/presentation/widgets/app_animations.dart';
import 'package:crevel/core/utils/animated_devider.dart';
import 'package:crevel/features/blog/presentation/widgets/blog_section.dart';
import 'package:crevel/features/blog/presentation/widgets/contact_section.dart';
import 'package:crevel/features/blog/presentation/widgets/flowbite_section.dart';
import 'package:crevel/features/blog/presentation/widgets/most_popular_section.dart';
import 'package:crevel/features/blog/presentation/widgets/new_on_blog_section.dart';
import 'package:crevel/features/blog/presentation/widgets/voice_assistant_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for navigation
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(), // Top
    GlobalKey(), // Middle
    GlobalKey(), // Bottom
  ];

  bool _isMenuOpen = false;

  /// Scroll to specific section
  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    _toggleMenu();
  }

  /// Toggle menu visibility
  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  /// Build sections list
  List<Widget> _buildSections() {
    return [
      _sectionWrapper(
        key: _sectionKeys[0],
        child: const SlideInFromLeft(child: FlowbiteSection()),
      ),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      const SliverToBoxAdapter(child: SlideInFromRight(child: BlogSection())),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      const SliverToBoxAdapter(
        child: SlideInFromLeft(child: MostPopularSection()),
      ),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      _sectionWrapper(key: _sectionKeys[1], child: const NewOnBlogSection()),
      SliverToBoxAdapter(child: SizedBox(height: 40.h)),
      const SliverToBoxAdapter(child: VoiceAssistantSection()),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      _sectionWrapper(key: _sectionKeys[2], child: const ContactSection()),
      SliverToBoxAdapter(child: SizedBox(height: 100.h)),
    ];
  }

  /// Section wrapper
  Widget _sectionWrapper({required Key key, required Widget child}) {
    return SliverToBoxAdapter(
      child: Container(key: key, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Stack(
          children: [
            // Main scrollable content
            CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: _buildSections(),
            ),
            // Floating navigation menu
            FloatingNavigationMenu(
              isMenuOpen: _isMenuOpen,
              onSectionTap: _scrollToSection,
              onBackdropTap: _toggleMenu,
            ),
          ],
        ),
      ),
      floatingActionButton: BlogFloatingActionButton(
        isMenuOpen: _isMenuOpen,
        onPressed: _toggleMenu,
      ),
    );
  }
}

// floating_navigation_menu.dart

class FloatingNavigationMenu extends StatelessWidget {
  final bool isMenuOpen;
  final Function(int) onSectionTap;
  final VoidCallback onBackdropTap;

  const FloatingNavigationMenu({
    super.key,
    required this.isMenuOpen,
    required this.onSectionTap,
    required this.onBackdropTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop
        if (isMenuOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: onBackdropTap,
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),
        // Menu items
        if (isMenuOpen) _buildMenuItems(),
      ],
    );
  }

  Widget _buildMenuItems() {
    final menuData = [
      {'icon': Icons.keyboard_arrow_up, 'tooltip': 'Top', 'index': 0},
      {'icon': Icons.more_horiz, 'tooltip': 'Middle', 'index': 1},
      {'icon': Icons.keyboard_arrow_down, 'tooltip': 'Bottom', 'index': 2},
    ];

    return Positioned(
      bottom: 90.h,
      right: 16.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: menuData.map((item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: NavigationMenuItem(
              icon: item['icon'] as IconData,
              tooltip: item['tooltip'] as String,
              onTap: () => onSectionTap(item['index'] as int),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// navigation_menu_item.dart
class NavigationMenuItem extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const NavigationMenuItem({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25.r),
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primaryText,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: AppColors.secondaryText,
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}

// blog_floating_action_button.dart
class BlogFloatingActionButton extends StatelessWidget {
  final bool isMenuOpen;
  final VoidCallback onPressed;

  const BlogFloatingActionButton({
    super.key,
    required this.isMenuOpen,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryText,
      onPressed: onPressed,
      child: Icon(
        isMenuOpen ? Icons.close : Icons.unfold_more,
        color: AppColors.secondaryText,
        size: 24.sp,
      ),
    );
  }
}

// blog_sections_builder.dart

class BlogSectionsBuilder {
  static List<Widget> buildSections(List<GlobalKey> sectionKeys) {
    return [
      _sectionWrapper(
        key: sectionKeys[0],
        child: const SlideInFromLeft(child: FlowbiteSection()),
      ),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      const SliverToBoxAdapter(child: SlideInFromRight(child: BlogSection())),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      const SliverToBoxAdapter(
        child: SlideInFromLeft(child: MostPopularSection()),
      ),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      _sectionWrapper(key: sectionKeys[1], child: const NewOnBlogSection()),
      SliverToBoxAdapter(child: SizedBox(height: 40.h)),
      const SliverToBoxAdapter(child: VoiceAssistantSection()),
      const SliverToBoxAdapter(child: AnimatedDivider()),
      _sectionWrapper(key: sectionKeys[2], child: const ContactSection()),
      SliverToBoxAdapter(child: SizedBox(height: 100.h)),
    ];
  }

  static Widget _sectionWrapper({required Key key, required Widget child}) {
    return SliverToBoxAdapter(
      child: Container(key: key, child: child),
    );
  }
}

// blog_scroll_controller.dart

class BlogScrollController {
  final ScrollController _scrollController = ScrollController();

  ScrollController get controller => _scrollController;

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void dispose() {
    _scrollController.dispose();
  }
}

// Simplified BlogView using all custom widgets
class SimplifiedBlogView extends StatefulWidget {
  const SimplifiedBlogView({super.key});

  @override
  State<SimplifiedBlogView> createState() => _SimplifiedBlogViewState();
}

class _SimplifiedBlogViewState extends State<SimplifiedBlogView> {
  final BlogScrollController _scrollController = BlogScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(3, (index) => GlobalKey());
  bool _isMenuOpen = false;

  void _scrollToSection(int index) {
    _scrollController.scrollToSection(_sectionKeys[index]);
    setState(() => _isMenuOpen = false);
  }

  void _toggleMenu() {
    setState(() => _isMenuOpen = !_isMenuOpen);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController.controller,
              physics: const BouncingScrollPhysics(),
              slivers: BlogSectionsBuilder.buildSections(_sectionKeys),
            ),
            FloatingNavigationMenu(
              isMenuOpen: _isMenuOpen,
              onSectionTap: _scrollToSection,
              onBackdropTap: _toggleMenu,
            ),
          ],
        ),
      ),
      floatingActionButton: BlogFloatingActionButton(
        isMenuOpen: _isMenuOpen,
        onPressed: _toggleMenu,
      ),
    );
  }
}