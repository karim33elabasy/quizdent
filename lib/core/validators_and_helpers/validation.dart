
class Validation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    if (value.length > 99) {
      return 'Password must be maximum 99 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validateConfirmPassword({required String? password, String? confirmPassword}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password.';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match.';
    }
    return null;
  }

  static String? validateName(String? firstName, {int minLength = 1, int maxLength = 50}) {
    if (firstName == null || firstName.isEmpty) {
      return 'First name cannot be empty.';
    }

    // Check if the first name contains only letters (and possibly spaces or hyphens)
    if (!RegExp(r'^[a-zA-Z\- ]+$').hasMatch(firstName)) {
      return 'First name can only contain letters, spaces, or hyphens.';
    }

    // Check minimum length
    if (firstName.length < minLength) {
      return 'First name must be at least $minLength characters long.';
    }

    // Check maximum length
    if (firstName.length > maxLength) {
      return 'First name cannot exceed $maxLength characters.';
    }

    return null; // Return null if validation passes
  }

  static String? validateEgyptianPhoneNumber(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "Please enter a phone number.";
    }

    final regex = RegExp(r'^(010|011|012|015)\d{8}$');
    if (!regex.hasMatch(input)) {
      return "Invalid phone number. It must be an 11-digit Egyptian number.";
    }

    return null;
  }

}
