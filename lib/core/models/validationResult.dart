class ValidationResult {
  final bool success;
  final String? error;

  ValidationResult({required this.success, this.error});

  factory ValidationResult.success() =>
      ValidationResult(success: true, error: null);

  factory ValidationResult.error(String message) =>
      ValidationResult(success: false, error: message);
}
