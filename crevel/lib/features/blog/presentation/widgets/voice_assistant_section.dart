
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:crevel/features/blog/presentation/widgets/voice_assistant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceAssistantSection extends StatelessWidget {
  const VoiceAssistantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Explore More topics', style: AppTextStyles.roboto28Primary600),
          SizedBox(height: 24.h),
          Column(
            children: [
              VoiceAssistantCard(),
              SizedBox(height: 16.h),
              VoiceAssistantCard(),
            ],
          ),
        ],
      ),
    );
  }
}