class ResponseModel {
  dynamic data;
  bool? succes;
  String? message;
  int? statusCode;

  ResponseModel({
    required this.data,
    this.succes,
    this.message,
    this.statusCode,
  });
}
