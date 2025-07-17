import 'dart:io';
import 'package:elwekala/features/auth/presentation/widgets/image_field.dart';
import 'package:elwekala/features/auth/presentation/widgets/register_button.dart';
import 'package:elwekala/features/auth/presentation/widgets/shared_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nationalIdController = TextEditingController();

  String? _selectedGender;
  File? _selectedImage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ProfileImagePicker(image: _selectedImage, onTap: _pickImage),
          SizedBox(height: 24.h),

          _SignupSharedFormField(
            nameController: _nameController,
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            phoneController: _phoneController,
            nationalIdController: _nationalIdController,
          ),

          SizedBox(height: 16.h),

          GenderSelector(
            selectedGender: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
          SizedBox(height: 24.h),

          RegisterButton(
            formKey: _formKey,
            nameController: _nameController,
            emailController: _emailController,
            passwordController: _passwordController,
            phoneController: _phoneController,
            nationalIdController: _nationalIdController,
            selectedGender: _selectedGender,
            selectedImage: _selectedImage,
          ),
        ],
      ),
    );
  }
}

class _SignupSharedFormField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final TextEditingController nationalIdController;

  const _SignupSharedFormField({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.nationalIdController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        NameField(controller: nameController),

        EmailField(controller: emailController),

        PasswordField(controller: passwordController),

        ConfirmPasswordField(
          controller: confirmPasswordController,
          passwordController: passwordController,
        ),

        PhoneField(controller: phoneController),

        NationalIdField(controller: nationalIdController),
      ],
    );
  }
}
