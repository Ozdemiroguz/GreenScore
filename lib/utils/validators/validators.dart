// Constants

import '../../core/models/validation_result.dart';

const minPasswordLength = 8;
RegExp emailRegexp = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[-a-zA-Z0-9]{0,253}\.)+[a-zA-Z]{2,}$');
RegExp alphanumericRegexp =
    RegExp(r'^[a-zA-Z0-9]+$'); // Only alphanumeric characters

// Data structure for validation results

// Function to check if a string is empty
bool isEmpty(String input) => input.trim().isEmpty;

// Function to check if a string exceeds a maximum length
bool exceedsMaxLength(String input, int maxLength) => input.length > maxLength;

// Validate username and return a ValidationResult
ValidationResult validateUsername(String? input) {
  if (isEmpty(input ?? '')) {
    //english message
    return ValidationResult.error('Username cannot be empty.');
  }

  if (input!.length < 5) {
    return ValidationResult.error('Username must be at least 5 characters.');
  }

  if (!alphanumericRegexp.hasMatch(input)) {
    return ValidationResult.error('Username must be alphanumeric.');
  }

  return ValidationResult.success();
}

ValidationResult validateName(String? input) {
  if (isEmpty(input ?? '')) {
    //english message
    return ValidationResult.error('Name cannot be empty.');
  }

  if (input!.length < 2) {
    return ValidationResult.error('Name must be at least 2 characters.');
  }

  return ValidationResult.success();
}

// Validate password and return a ValidationResult
ValidationResult validatePassword(String? input) {
  if (isEmpty(input ?? '')) {
    //english message
    return ValidationResult.error('Password cannot be empty.');
  }

  if (input!.length < minPasswordLength) {
    return ValidationResult.error(
        'Password must be at least $minPasswordLength characters.');
  }

  // You might consider adding complexity requirements here,
  // such as requiring uppercase, lowercase, numbers, and symbols.

  return ValidationResult.success();
}

// Validate email and return a ValidationResult
ValidationResult validateEmail(String email) {
  if (isEmpty(email)) {
//english message
    return ValidationResult.error("Email cannot be empty. ");
  }

  if (!emailRegexp.hasMatch(email)) {
    return ValidationResult.error("Invalid email format.");
  }

  return ValidationResult.success();
}

ValidationResult validatePasswordCheck(String password, String passwordCheck) {
  if (isEmpty(passwordCheck)) {
    return ValidationResult.error("Password cannot be empty.");
  }

  if (password != passwordCheck) {
    return ValidationResult.error("Passwords do not match.");
  }

  return ValidationResult.success();
}

ValidationResult validatePhoneNumber(String? value) {
  String pattern = r'^(\d{3} \d{3} \d{2} \d{2})$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value!)) {
    return ValidationResult.error("Invalid phone number format.");
  } else {
    return ValidationResult.success();
  }
}
