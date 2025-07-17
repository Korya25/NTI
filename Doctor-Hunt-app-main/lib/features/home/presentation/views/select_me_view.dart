import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/presentation/views/background_scaffold.dart';
import 'package:doctor_hunt/core/presentation/widgets/custom_animate_do.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/date_tabs_with_slots.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/select_me_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectMeView extends StatelessWidget {
  const SelectMeView({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.h20v20,
          child: Column(
            spacing: 18.h,
            children: [
              CustomAppBar(title: AppString.selectMe),
              Expanded(
                child: SingleChildScrollView(
                  child: _SelectMeViewBody(doctor: doctor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectMeViewBody extends StatelessWidget {
  const _SelectMeViewBody({required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14.h,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomFadeIn(
          direction: FadeDirection.right,
          child: SelectMeCard(doctor: doctor),
        ),
        CustomFadeIn(
          direction: FadeDirection.up,
          child: const DateTabsWithSlots(),
        ),
      ],
    );
  }
}
