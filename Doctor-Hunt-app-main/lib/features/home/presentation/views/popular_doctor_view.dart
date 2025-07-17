import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_vertical_list_view.dart';
import 'package:doctor_hunt/core/presentation/widgets/search_input_field.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/popular_doctor_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorView extends StatelessWidget {
  const PopularDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.h20v20,
          child: Column(
            spacing: 20.h,
            children: [
              // App BAr
              CustomAppBar(title: AppString.popularDoctors),
              // Search Input Field
              SearchInputField(hintText: AppString.searchHint),
              //
              Expanded(child: _PopularDoctorViewList()),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopularDoctorViewList extends StatelessWidget {
  const _PopularDoctorViewList();

  @override
  Widget build(BuildContext context) {
    final doctors = DoctorData.popularDoctors;

    return CustomVerticalListView(
      itemCount: doctors.length,
      itemBuilder: (context, index) =>
          PopularDoctorViewCard(doctor: doctors[index]),
    );
  }
}
