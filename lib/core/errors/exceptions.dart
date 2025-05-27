class RateLimitExceededException implements Exception {
  final String message;
  RateLimitExceededException(this.message);

  @override
  String toString() => message;
}
