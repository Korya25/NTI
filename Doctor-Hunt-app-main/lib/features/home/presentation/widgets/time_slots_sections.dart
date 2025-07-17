import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/time_slot_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotsSections extends StatelessWidget {
  const TimeSlotsSections({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  static const String _afternoonTitle = 'Afternoon 7 slots';
  static const String _eveningTitle = 'Evening 5 slots';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimeSlotSection(
          title: _afternoonTitle,
          slots: DoctorData.afternoonSlots,
        ),
        _buildTimeSlotSection(
          title: _eveningTitle,
          slots: DoctorData.eveningSlots,
        ),
      ],
    );
  }

  Widget _buildTimeSlotSection({
    required String title,
    required List<String> slots,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        _buildSectionTitle(title),
        SizedBox(height: 8.h),
        _buildTimeSlotGrid(slots),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTextStyles.rubik16MediumPrimary);
  }

  Widget _buildTimeSlotGrid(List<String> slots) {
    return _TimeSlotGrid(
      slots: slots,
      selectedTime: selectedTime,
      onTimeSelected: onTimeSelected,
    );
  }
}

class _TimeSlotGrid extends StatelessWidget {
  const _TimeSlotGrid({
    required this.slots,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final List<String> slots;
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  static const double _minItemWidth = 100.0;
  static const double _childAspectRatio = 2.5;
  static const double _mainAxisSpacing = 12.0;
  static const double _crossAxisSpacing = 12.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _calculateCrossAxisCount(constraints);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: _childAspectRatio,
            mainAxisSpacing: _mainAxisSpacing,
            crossAxisSpacing: _crossAxisSpacing,
          ),
          itemCount: slots.length,
          itemBuilder: (context, index) => _buildTimeSlotCard(index),
        );
      },
    );
  }

  int _calculateCrossAxisCount(BoxConstraints constraints) {
    return (constraints.maxWidth / _minItemWidth)
        .floor()
        .clamp(1, double.infinity)
        .toInt();
  }

  Widget _buildTimeSlotCard(int index) {
    final timeSlot = slots[index];

    return TimeSlotCard(
      time: timeSlot,
      isSelected: timeSlot == selectedTime,
      onTap: () => onTimeSelected(timeSlot),
    );
  }
}
