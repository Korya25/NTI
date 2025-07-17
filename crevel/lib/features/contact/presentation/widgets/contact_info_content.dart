import 'package:crevel/core/constants/app_assets.dart';
import 'package:crevel/core/presentation/widgets/social_media_widget.dart';
import 'package:crevel/features/contact/presentation/widgets/contact_item.dart';
import 'package:crevel/features/contact/presentation/widgets/location_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationData {
  final String office;
  final String address;
  final double? latitude;
  final double? longitude;

  const LocationData({
    required this.office,
    required this.address,
    this.latitude,
    this.longitude,
  });
}

class ContactInfoContent extends StatelessWidget {
  final String? appLogoPath;
  final String phoneNumber;
  final String email;
  final String website;
  final List<LocationData> locations;

  const ContactInfoContent({
    super.key,
    this.appLogoPath = AppAssets.appNameImage,
    this.phoneNumber = '+20 100 123 4567',
    this.email = 'enthrj3@gmail.com',
    this.website = 'www.yourwebsite.com',
    this.locations = const [
      LocationData(
        office: 'Cairo Office',
        address: 'Maadi, Cairo, Egypt',
        latitude: 29.9602,
        longitude: 31.2569,
      ),
      LocationData(
        office: 'Giza Office',
        address: 'Smart Village, Giza, Egypt',
        latitude: 30.0715,
        longitude: 31.0127,
      ),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Logo
        if (appLogoPath != null)
          Center(child: Image.asset(appLogoPath!, width: 200.w)),
        SizedBox(height: 20.h),

        // Social Media Widget (placeholder - you need to implement this)
        const Center(
          child: SocialMediaWidgetCustom(layout: SocialMediaLayout.horizontal),
        ),
        SizedBox(height: 20.h),

        // Contact Items
        ContactItem(
          icon: Icons.phone,
          title: 'Phone Number',
          value: phoneNumber,
        ),
        SizedBox(height: 16.h),
        ContactItem(icon: Icons.email, title: 'Email Address', value: email),
        SizedBox(height: 16.h),
        ContactItem(icon: Icons.language, title: 'Website', value: website),
        SizedBox(height: 20.h),

        // Location Items
        ...locations.map(
          (location) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: LocationItem(
              office: location.office,
              address: location.address,
              latitude: location.latitude,
              longitude: location.longitude,
            ),
          ),
        ),
      ],
    );
  }
}

