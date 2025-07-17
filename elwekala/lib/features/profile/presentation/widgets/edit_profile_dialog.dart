import 'dart:io';

import 'package:elwekala/core/cache/cache_helper.dart';
import 'package:elwekala/core/cache/cache_keys.dart';
import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/core/utils/validators.dart';
import 'package:elwekala/core/widgets/custom_button.dart';
import 'package:elwekala/core/widgets/custom_text_form_field.dart';
import 'package:elwekala/features/profile/presentation/controller/profile_cubit.dart';
import 'package:elwekala/features/profile/presentation/controller/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileDialog extends StatefulWidget {
  final UserEntity user;

  const EditProfileDialog({super.key, required this.user});

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _nationalIdController;

  String? _selectedGender;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    _nationalIdController = TextEditingController(text: widget.user.nationalId);
    _selectedGender = widget.user.gender;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      final token = CacheHelper.sharedPreferences.getString(CacheKeys.token);
      if (token == null) return;

      context.read<ProfileCubit>().updateProfile(
            token: token,
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            gender: _selectedGender ?? '',
            password: '123456789',
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccessState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم تحديث البيانات بنجاح'),
              backgroundColor: AppColors.successColor,
            ),
          );
        } else if (state is ProfileUpdateErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Form
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Profile Image
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.secondaryColor,
                              border: Border.all(
                                color: AppColors.borderColor,
                                width: 2,
                              ),
                            ),
                            child: _selectedImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(40.r),
                                    child: Image.file(
                                      _selectedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.camera_alt,
                                    size: 30.sp,
                                    color: AppColors.iconColor,
                                  ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        CustomTextFormField(
                          labelText: AppStrings.name,
                          controller: _nameController,
                          validator: Validators.validateRequired,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: AppColors.iconColor,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        CustomTextFormField(
                          labelText: AppStrings.email,
                          controller: _emailController,
                          validator: Validators.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.iconColor,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        CustomTextFormField(
                          labelText: AppStrings.phone,
                          controller: _phoneController,
                          validator: Validators.validatePhone,
                          keyboardType: TextInputType.phone,
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: AppColors.iconColor,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        CustomTextFormField(
                          labelText: AppStrings.nationalId,
                          controller: _nationalIdController,
                          validator: Validators.validateNationalId,
                          keyboardType: TextInputType.number,
                          prefixIcon: Icon(
                            Icons.badge_outlined,
                            color: AppColors.iconColor,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Gender
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.gender,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: Text(AppStrings.male),
                                    value: AppStrings.male,
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: Text(AppStrings.female),
                                    value: AppStrings.female,
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Buttons
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: AppStrings.cancel,
                      onPressed: () => Navigator.of(context).pop(),
                      backgroundColor: AppColors.secondaryColor,
                      textColor: AppColors.primaryTextColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return CustomButton(
                          text: AppStrings.save,
                          onPressed: _handleSave,
                          isLoading: state is ProfileUpdateLoadingState,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
