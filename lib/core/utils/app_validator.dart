class AppValidator {
  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a username';
    } else if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    } else if (!RegExp(
      r'^[\p{L}\p{N}_]+$',
      unicode: true,
    ).hasMatch(value.trim())) {
      return 'Username can only contain letters\nnumbers, and underscore';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your first name';
    } else if (value.trim().length < 2) {
      return 'First name must be at least 2 characters';
    } else if (!RegExp(r'^[\p{L}\s]+$', unicode: true).hasMatch(value.trim())) {
      return 'First name can only contain letters and spaces';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your last name';
    } else if (value.trim().length < 2) {
      return 'Last name must be at least 2 characters';
    } else if (!RegExp(r'^[\p{L}\s]+$', unicode: true).hasMatch(value.trim())) {
      return 'Last name can only contain letters and spaces';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return 'Please enter a password';
    }

    if (trimmed.length < 6) {
      return 'Password must be at least 6 characters\nand contain uppercase letter\nnumber, and special character';
    }

    final hasUppercase = RegExp(r'[A-Z]').hasMatch(trimmed);
    final hasDigit = RegExp(r'\d').hasMatch(trimmed);
    final hasSpecial = RegExp(r'[@$!%*?&]').hasMatch(trimmed);

    if (hasUppercase && hasDigit && hasSpecial) {
      return null;
    }

    return 'Password must be at least 6 characters\nand contain uppercase letter\nnumber, and special character (@\$!%*?&)';
  }

  static String? validateConfirmPassword(
    String? value,
    String originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final cleaned = value.replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^\+?\d{10,15}$').hasMatch(cleaned)) {
      return 'Please enter a valid phone number (10-15 digits)';
    }
    return null;
  }
}
