class AuthException implements Exception {
  final String errorCode;
  final String errorMessage;

  AuthException({required this.errorCode, required this.errorMessage});
}
