class InputValidators {
  InputValidators._();

  static String? name(String? value) {
    if (value != null && value.isEmpty) {
      return 'Name is required.';
    }

    final regex = RegExp(r"^[a-zA-Z\s-']+( [a-zA-Z\s-']+)+$");

    if (value != null && !regex.hasMatch(value)) {
      return 'Name can only contain letters, spaces, hyphens, and apostrophes.';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    }

    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%.*?&])[A-Za-z\d@$!%.*?&]{8,}$',
    );

    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.';
    }

    return null;
  }

  static String? confirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password.';
    }

    if (value != originalPassword) {
      return 'Passwords do not match.';
    }

    return null;
  }
}
