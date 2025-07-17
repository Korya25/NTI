import 'package:doctor_hunt/core/presentation/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/date_tab.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/time_slots_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTabsWithSlots extends StatefulWidget {
  const DateTabsWithSlots({super.key});

  @override
  State<DateTabsWithSlots> createState() => _DateTabsWithSlotsState();
}

class _DateTabsWithSlotsState extends State<DateTabsWithSlots> {
  int _selectedDateTab = 1;
  String _selectedTime = '2:00 PM';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14.h,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Date Tabs
        CustomHorizontalListView(
          height: 80.h,
          itemCount: DoctorData.dateTabs.length,
          itemBuilder: (context, index) => DateTab(
            date: DoctorData.dateTabs[index],
            slotsAvailable: DoctorData.getSlotsAvailableText(index),
            isSelected: _selectedDateTab == index,
            onTap: () {
              setState(() {
                _selectedDateTab = index;
              });
            },
          ),
        ),
        // Date
        Text(
          DoctorData.dateTabs[_selectedDateTab],
          style: AppTextStyles.rubik18MediumPrimary,
        ),
        TimeSlotsSections(
          selectedTime: _selectedTime,
          onTimeSelected: (value) {
            setState(() {
              _selectedTime = value;
            });
          },
        ),
      ],
    );
  }
}
