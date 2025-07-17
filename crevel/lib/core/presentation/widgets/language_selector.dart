import 'package:crevel/core/constants/app_colors.dart';
import 'package:crevel/core/presentation/widgets/menu_constant.dart';
import 'package:crevel/features/contact/presentation/widgets/custom_dropdown_field.dart';
import 'package:flutter/material.dart';


class LanguageSelector extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const LanguageSelector({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownField(
      value: _selectedLanguage,
      items: MenuConstants.languageOptions,
      hintText: MenuConstants.languageHint,
      onChanged: _handleLanguageChange,
      backgroundColor: AppColors.main,
      borderColor: AppColors.main,
      dropdownColor: AppColors.main,
      textColor: AppColors.primaryIcon,
      hintColor: Colors.blue[200],
      iconColor: AppColors.primaryIcon,
      selectedItemColor: AppColors.primaryIcon,
      borderWidth: MenuConstants.borderWidth,
      borderRadius: MenuConstants.borderRadius,
    );
  }

  void _handleLanguageChange(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedLanguage = newValue;
      });
      widget.onChanged?.call(newValue);
    }
  }
}