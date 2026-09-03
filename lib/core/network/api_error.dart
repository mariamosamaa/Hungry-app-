class ApiError {
  final String message;
  final int? statuscode;
  ApiError({required this.message, this.statuscode});

  String tostring() {
    return 'error is $message (statuscode is $statuscode)';
  }
}
