import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/resources/app_routes.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_header_section.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/data/test_data/fake_users.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/category_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_home_section.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/featured_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home_header.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/live_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/popular_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildHeader(),
            _buildLiveDoctorsSection(context),
            _buildSpacing(28.h),
            _buildCategoriesSection(context),
            _buildSpacing(18.h),
            _buildPopularDoctorsSection(context),
            _buildFeaturedDoctorsSection(context),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 190.h,
        width: double.infinity,
        child: CustomFadeIn(
          direction: FadeDirection.down,
          child: HomeHeader(
            userName: fakeUsers[0].name,
            userImage: fakeUsers[0].imageUrl,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildLiveDoctorsSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomHomeSection(
        headerSection: const CustomHeaderSection(title: AppString.liveDoctors),
        horizontallistView: CustomHorizontalListView(
          height: 170.h,
          itemCount: DoctorData.liveDoctors.length,
          itemBuilder: (context, index) => _buildLiveDoctorItem(context, index),
        ),
      ),
    );
  }

  Widget _buildLiveDoctorItem(BuildContext context, int index) {
    final doctor = DoctorData.liveDoctors[index];
    return GestureDetector(
      onTap: () => _navigateToLiveChat(context, doctor),
      child: LiveDoctorCard(doctorModel: doctor),
    );
  }

  SliverToBoxAdapter _buildCategoriesSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppPadding.horizontal20,
        child: CustomHorizontalListView(
          height: 85.h,
          itemCount: CategoryCardModel.categories.length,
          itemBuilder: (context, index) => _buildCategoryItem(context, index),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    final category = CategoryCardModel.categories[index];
    return GestureDetector(
      onTap: () => _navigateToFindDoctor(context, category),
      child: CategoryCard(cardModel: category),
    );
  }

  SliverToBoxAdapter _buildPopularDoctorsSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomHomeSection(
        headerSection: CustomHeaderSection(
          title: AppString.popularDoctors,
          activeSeeAll: true,
          onSeeAllPressed: () => _navigateToPopularDoctors(context),
        ),
        horizontallistView: CustomHorizontalListView(
          height: 240.h,
          itemCount: DoctorData.popularDoctors.length,
          itemBuilder: (context, index) {
            final doctor = DoctorData.popularDoctors[index];
            return PopularDoctorCard(doctorModel: doctor);
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildFeaturedDoctorsSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppPadding.bottom20,
        child: CustomHomeSection(
          headerSection: CustomHeaderSection(
            title: AppString.featuredDoctor,
            activeSeeAll: true,
            onSeeAllPressed: () => _navigateToFeaturedDoctors(context),
          ),
          horizontallistView: CustomHorizontalListView(
            height: 170.h,
            itemCount: DoctorData.featuredDoctors.length,
            itemBuilder: (context, index) {
              final doctor = DoctorData.featuredDoctors[index];
              return FeaturedDoctorCard(doctorModel: doctor);
            },
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSpacing(double height) {
    return SliverToBoxAdapter(child: SizedBox(height: height));
  }

  void _navigateToLiveChat(BuildContext context, dynamic doctor) {
    context.pushNamed(
      AppRoutes.doctorLiveChat,
      extra: {'doctor': doctor, 'user': fakeUsers[0]},
    );
  }

  void _navigateToFindDoctor(BuildContext context, dynamic category) {
    context.pushNamed(AppRoutes.findDoctor, extra: category);
  }

  void _navigateToPopularDoctors(BuildContext context) {
    context.pushNamed(AppRoutes.popularDoctors);
  }

  void _navigateToFeaturedDoctors(BuildContext context) {
    context.pushNamed(AppRoutes.featuredDoctors);
  }
}
