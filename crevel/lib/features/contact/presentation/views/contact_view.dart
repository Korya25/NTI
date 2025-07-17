import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/features/contact/data/services_data.dart';
import 'package:crevel/features/contact/presentation/widgets/contact_form_fields.dart';
import 'package:crevel/features/contact/presentation/widgets/contact_info_card.dart';
import 'package:crevel/features/contact/presentation/widgets/contact_title.dart';
import 'package:crevel/features/contact/presentation/widgets/form_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [SliverToBoxAdapter(child: ContactViewBody())],
          ),
        ),
      ),
    );
  }
}

class ContactViewBody extends StatefulWidget {
  const ContactViewBody({super.key});

  @override
  State<ContactViewBody> createState() => _ContactViewBodyState();
}

class _ContactViewBodyState extends State<ContactViewBody> {
  final _formKey = GlobalKey<FormState>();
  late final FormControllers _controllers;
  String? _selectedService;

  @override
  void initState() {
    super.initState();
    _controllers = FormControllers();
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 70.h),

        // Title Section
        const ContactTitle(),
        SizedBox(height: 40.h),

        // Form Fields
        ContactFormFields(
          formKey: _formKey,
          firstNameController: _controllers.firstName,
          lastNameController: _controllers.lastName,
          phoneController: _controllers.phone,
          emailController: _controllers.email,
          messageController: _controllers.message,
          selectedService: _selectedService,
          services: fakeServices,
          onServiceChanged: _onServiceChanged,
          onSubmit: _handleSubmit,
          autoValidate: true,
        ),
        SizedBox(height: 40.h),

        // Contact Info Card
        const ContactInfoCard(),
      ],
    );
  }

  void _onServiceChanged(String? newValue) {
    setState(() {
      _selectedService = newValue;
    });
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _showSuccessMessage();
      _clearForm();
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Inquiry sent successfully!'),
        backgroundColor: AppColors.primaryText,
      ),
    );
  }

  void _clearForm() {
    _controllers.clear();
    setState(() {
      _selectedService = null;
    });
  }
}
