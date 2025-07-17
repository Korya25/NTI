import 'package:crevel/core/utils/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/resources/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text_field.dart';
import 'custom_dropdown_field.dart';

class ContactFormFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final String? selectedService;
  final List<String> services;
  final void Function(String?) onServiceChanged;
  final VoidCallback onSubmit;
  final bool autoValidate;

  const ContactFormFields({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.emailController,
    required this.messageController,
    required this.selectedService,
    required this.services,
    required this.onServiceChanged,
    required this.onSubmit,
    this.autoValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // First Name Field
          CustomTextField(
            controller: firstNameController,
            hintText: 'Your First Name',
            isRequired: true,
            autoValidate: autoValidate,
            validator: AppValidators.validateName,
            validationFieldName: 'first name',
            minLength: 2,
            maxLength: 50,
          ),
          SizedBox(height: 16.h),

          // Last Name Field
          CustomTextField(
            controller: lastNameController,
            hintText: 'Your Last Name',
            isRequired: true,
            autoValidate: autoValidate,
            validator: AppValidators.validateName,
            validationFieldName: 'last name',
            minLength: 2,
            maxLength: 50,
          ),
          SizedBox(height: 16.h),

          // Service Dropdown
          CustomDropdownField(
            value: selectedService,
            items: services,
            hintText: 'Select Service of Interest',
            onChanged: onServiceChanged,
            autoValidate: autoValidate,
          ),
          SizedBox(height: 16.h),

          // Phone Field (Optional)
          CustomTextField(
            controller: phoneController,
            hintText: 'Your Phone Number (Optional)',
            keyboardType: TextInputType.phone,
            autoValidate: autoValidate,
            validator: AppValidators.validatePhone,
          ),
          SizedBox(height: 16.h),

          // Email Field
          CustomTextField(
            controller: emailController,
            hintText: 'Your Email Address',
            keyboardType: TextInputType.emailAddress,
            isRequired: true,
            autoValidate: autoValidate,
          ),
          SizedBox(height: 16.h),

          // Message Field
          CustomTextField(
            controller: messageController,
            hintText: 'Tell us about your project or message...',
            maxLines: 6,
            isRequired: true,
            autoValidate: autoValidate,
            validator: AppValidators.validateMessage,
            validationFieldName: 'message',
            minLength: 10,
            maxLength: 500,
          ),
          SizedBox(height: 32.h),

          // Submit Button
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryText,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          elevation: 0,
        ),
        child: Text(
          'Send Inquiry',
          style: AppTextStyles.roboto18Secondary500.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

