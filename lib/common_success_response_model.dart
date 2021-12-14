import 'dart:convert';

CommonSuccessResponseModel commonSuccessResponseModelFromJson(String str) =>
    CommonSuccessResponseModel.fromJson(json.decode(str) as Map<String,dynamic>);

String commonSuccessResponseModelToJson(CommonSuccessResponseModel data) =>
    json.encode(data.toJson());

class CommonSuccessResponseModel {
  CommonSuccessResponseModel({
    this.code,
    this.message,
    this.byteData,
  });

  final String? code;
  final String? message;
  dynamic byteData;

  factory CommonSuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonSuccessResponseModel(
        code: json["code"] as String,
        message: json["message"] as String,
        byteData: json["byteData"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "byteData": byteData,
      };
}
