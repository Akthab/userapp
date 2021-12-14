import 'dart:convert';

// LOGIN RESPONSE MODEL
LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

// TOKEN MODEL
Tokens tokensFromJson(String str) =>
    Tokens.fromJson(json.decode(str) as Map<String, dynamic>);

String tokensToJson(Tokens data) => json.encode(data.toJson());

// DELEGATE MODEL
Delegate delegateFromJson(String str) =>
    Delegate.fromJson(json.decode(str) as Map<String, dynamic>);

String delegateToJson(Delegate data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.delegate,
    this.tokens,
  });

  Delegate? delegate;
  Tokens? tokens;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        delegate: Delegate.fromJson(json["delegate"] as Map<String, dynamic>),
        tokens: Tokens.fromJson(json["tokens"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "delegate": delegate?.toJson(),
        "tokens": tokens?.toJson(),
      };
}

class Tokens {
  Tokens({
    this.access,
    this.refresh,
  });

  Access? access;
  Access? refresh;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: Access.fromJson(json["access"] as Map<String, dynamic>),
        refresh: Access.fromJson(json["refresh"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "access": access?.toJson(),
        "refresh": refresh?.toJson(),
      };
}

class Access {
  Access({
    this.token,
    this.expires,
  });

  String? token;
  DateTime? expires;

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"] as String,
        expires: DateTime.parse(json["expires"] as String),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires?.toIso8601String(),
      };
}

class Delegate {
  Delegate({
    this.email,
    this.name,
    this.id,
    this.school,
    this.country,
    this.profileImage,
    this.committeeId,
    this.conferenceId,
    this.countryCode,
  });

  String? email;
  String? name;
  String? id;
  String? school;
  String? country;
  String? profileImage;
  String? committeeId;
  String? conferenceId;
  String? countryCode;

  factory Delegate.fromJson(Map<String, dynamic> json) => Delegate(
      email: json["email"] as String,
      name: json["name"] as String,
      id: json["id"] as String,
      school: json["school"] as String,
      country: json["country"] as String,
      profileImage: json["profileImage"] as String,
      countryCode: json["countryCode"] as String,
      committeeId:
          json["committeeId"] == null ? "" : json["committeeId"] as String,
      conferenceId:
          json["conferenceId"] == null ? "" : json["conferenceId"] as String);

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "id": id,
        "school": school,
        "country": country,
        "profileImage": profileImage,
        "committeeId": committeeId,
        "conferenceId": conferenceId,
        "countryCode": countryCode,
      };
}
