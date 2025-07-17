import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_vertical_list_view.dart';
import 'package:doctor_hunt/core/presentation/widgets/search_input_field.dart';
import 'package:doctor_hunt/features/home/data/models/category_card_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/find_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorView extends StatelessWidget {
  const FindDoctorView({super.key, required this.categoryCardModel});

  final CategoryCardModel categoryCardModel;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.h20v20,
          child: Column(
            spacing: 26.h,
            children: [
              CustomAppBar(title: AppString.findDoctor),
              CustomFadeIn(
                direction: FadeDirection.right,
                child: const SearchInputField(hintText: AppString.searchHint),
              ),

              Expanded(
                child: CustomFadeIn(
                  direction: FadeDirection.up,
                  child: CustomVerticalListView(
                    itemCount: categoryCardModel.doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = categoryCardModel.doctors[index];
                      return FindDoctorCard(doctorModel: doctor);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
