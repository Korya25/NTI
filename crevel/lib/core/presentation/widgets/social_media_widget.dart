import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaPlatform {
  final String name;
  final IconData icon;
  final String url;
  final Color? color;

  const SocialMediaPlatform({
    required this.name,
    required this.icon,
    required this.url,
    this.color,
  });
}

enum SocialMediaLayout { horizontal, vertical, grid }
enum SocialMediaAlignment { left, center, right }

class SocialMediaWidgetCustom extends StatelessWidget {
  final SocialMediaLayout layout;
  final List<SocialMediaPlatform> platforms;
  final int gridColumns;
  final SocialMediaAlignment alignment;
  final double spacing;
  final double iconSize;

  const SocialMediaWidgetCustom({
    super.key,
    required this.layout,
    this.platforms = const [
      SocialMediaPlatform(
        name: 'Facebook',
        icon: FontAwesomeIcons.facebookF,
        url: 'https://www.facebook.com/share/1CcBba6jt3/',
      ),
      SocialMediaPlatform(
        name: 'Instagram',
        icon: FontAwesomeIcons.instagram,
        url: 'https://www.instagram.com/ko_ry_a1?igsh=OWJqaHg3YmlrOHk2',
      ),
      SocialMediaPlatform(
        name: 'LinkedIn',
        icon: FontAwesomeIcons.linkedinIn,
        url:
            'https://www.linkedin.com/in/mahmoud-mohamed-5938ab28a?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
      ),
      SocialMediaPlatform(
        name: 'Twitter',
        icon: FontAwesomeIcons.xTwitter,
        url: 'https://x.com/mosalah?lang=ar',
      ),
    ],
    this.gridColumns = 2,
    this.alignment = SocialMediaAlignment.center,
    this.spacing = 16.0,
    this.iconSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    final content = _buildContent();
    
    switch (alignment) {
      case SocialMediaAlignment.left:
        return Align(alignment: Alignment.centerLeft, child: content);
      case SocialMediaAlignment.center:
        return Center(child: content);
      case SocialMediaAlignment.right:
        return Align(alignment: Alignment.centerRight, child: content);
    }
  }

  Widget _buildContent() {
    switch (layout) {
      case SocialMediaLayout.horizontal:
        return _buildHorizontalLayout();
      case SocialMediaLayout.vertical:
        return _buildVerticalLayout();
      case SocialMediaLayout.grid:
        return _buildGridLayout();
    }
  }

  Widget _buildHorizontalLayout() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: platforms.asMap().entries.map((entry) {
        final index = entry.key;
        final platform = entry.value;
        return Padding(
          padding: EdgeInsets.only(right: index < platforms.length - 1 ? spacing.w : 0),
          child: _buildSocialMediaButton(platform),
        );
      }).toList(),
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: platforms.asMap().entries.map((entry) {
        final index = entry.key;
        final platform = entry.value;
        return Padding(
          padding: EdgeInsets.only(bottom: index < platforms.length - 1 ? spacing.h : 0),
          child: _buildSocialMediaButton(platform),
        );
      }).toList(),
    );
  }

  Widget _buildGridLayout() {
    return Wrap(
      spacing: spacing.w,
      runSpacing: spacing.h,
      alignment: _getWrapAlignment(),
      children: platforms.map(_buildSocialMediaButton).toList(),
    );
  }

  WrapAlignment _getWrapAlignment() {
    switch (alignment) {
      case SocialMediaAlignment.left:
        return WrapAlignment.start;
      case SocialMediaAlignment.center:
        return WrapAlignment.center;
      case SocialMediaAlignment.right:
        return WrapAlignment.end;
    }
  }

  Widget _buildSocialMediaButton(SocialMediaPlatform platform) {
    return GestureDetector(
      onTap: () => _launchSocialMedia(platform.url),
      child: Icon(
        platform.icon,
        color: platform.color ?? AppColors.secondaryText,
        size: iconSize.sp,
      ),
    );
  }

  void _launchSocialMedia(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error launching social media URL: $e');
    }
  }
}