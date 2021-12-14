import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str) as Map<String, dynamic>);

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        email: json["email"] as String,
        password: json["password"] as String,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
