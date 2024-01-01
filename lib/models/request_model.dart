// ignore_for_file: public_member_api_docs, sort_constructors_first

enum HTTPMethods { GET, POST, PATCH, DELETE, PUT }

class RequestModel {
  String? path;
  dynamic body;
  HTTPMethods? method;
  Map<String, String>? headers;
  Map<String, String>? queryParams;

  RequestModel({
    this.path,
    this.body,
    this.method,
    this.headers,
    this.queryParams,
  });

  RequestModel copyWith({
    String? path,
    dynamic? body,
    HTTPMethods? method,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) {
    return RequestModel(
      path: path ?? this.path,
      body: body ?? this.body,
      method: method ?? this.method,
      headers: headers ?? this.headers,
      queryParams: queryParams ?? this.queryParams,
    );
  }
}
