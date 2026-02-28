base class ApiBaseModel {
  final int statusCode;
  final String? message;

  ApiBaseModel({
    required this.statusCode,
    this.message,
  });
}
