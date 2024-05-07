class ResponseEntity {
  static const String defaultErrorMessage = 'weak internet connection';

  dynamic data;
  int? statusCode;
  String? errorField;

  bool _hasError = true;
  String message = defaultErrorMessage;

  bool get hasError => _hasError;

  ResponseEntity.fromJson({
    required Map<String, dynamic> json,
    required this.statusCode,
  }) {
    _hasError = (statusCode != 200);
    if (json['data'] != null) {
      data = json['data'];
    } else {
      data = json;
    }
    // if (statusCode == 400 && json['message'] != null) {
    // }
    message = json['message'] ?? defaultErrorMessage;
    errorField = json['errorField'];
  }

  ResponseEntity.failed() {
    statusCode = -1;
  }

  ResponseEntity.success() {
    message = 'Success';
    statusCode = 200;
  }
}
