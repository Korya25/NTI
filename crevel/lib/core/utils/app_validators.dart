class AppValidators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  // Name validation
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  // Phone validation (optional)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Optional field
    }
    if (value.trim().length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Message validation
  static String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please tell us about your project';
    }
    if (value.trim().length < 10) {
      return 'Message must be at least 10 characters';
    }
    return null;
  }

  // Dropdown validation
  static String? validateDropdown(String? value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null;
  }

  // Custom validation with custom message
  static String? validateCustom(String? value, String fieldName, {int? minLength, int? maxLength}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your $fieldName';
    }
    
    if (minLength != null && value.trim().length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    
    if (maxLength != null && value.trim().length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }
    
    return null;
  }
}
