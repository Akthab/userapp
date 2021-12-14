import 'dart:convert';

ErrorResponseModel errorResponseModelFromJson(String str) =>
    ErrorResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

String errorResponseModelToJson(ErrorResponseModel data) =>
    json.encode(data.toJson());

class ErrorResponseModel {
  ErrorResponseModel({
    this.code,
    this.message,
  });

  final int? code;
  final String? message;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(
        code: json["code"] as int,
        message: json["message"] as String,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
