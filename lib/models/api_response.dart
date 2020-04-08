import 'dart:convert';

class ApiResponse {
  final dynamic data;
  final int statusCode;
  final String error;
  final String status;
  final String message;

  bool get hasData => data != null;
  bool get hasError => error != null;


  ApiResponse({this.data, this.statusCode, this.status, this.error, this.message});


  factory ApiResponse.fromJson(String jsonString) {
    var data = json.decode(jsonString);
    return ApiResponse(
      data: data['data'],
      error: data['error'] as String,
      status: data['status'] as String,
      message: data['message'] as String,
    );
  }

}