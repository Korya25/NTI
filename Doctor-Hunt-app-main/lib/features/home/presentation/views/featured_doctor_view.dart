import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/search_input_field.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/featured_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedDoctorView extends StatelessWidget {
  const FeaturedDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.h20v20,
          child: Column(
            spacing: 20.h,
            children: [
              const CustomAppBar(title: AppString.featuredDoctor),
              SearchInputField(hintText: AppString.searchHint),
              const Expanded(child: _FeaturedDoctorViewBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedDoctorViewBody extends StatelessWidget {
  const _FeaturedDoctorViewBody();
  @override
  Widget build(BuildContext context) {
    List<DoctorModel> doctors = DoctorData.featuredDoctors;
    return CustomFadeIn(
      direction: FadeDirection.up,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: AppPadding.all8,
            child: FeaturedDoctorCard(doctorModel: doctors[index]),
          );
        },
      ),
    );
  }
}
