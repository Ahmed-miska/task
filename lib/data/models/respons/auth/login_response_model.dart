// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  final int statusCode;
  final bool success;
  final Data data;
  final String message;

  LoginResponseModel({
    required this.statusCode,
    required this.success,
    required this.data,
    required this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        statusCode: json["status_code"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  final String userId;
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String password;
  final String photo;
  final String token;
  final String firebaseToken;
  final DateTime lastUpdated;
  final DateTime createdAtUser;
  final String loginType;
  final String loged;
  final String socialId;
  final String userStatus;
  final String userCurrentCityId;
  final String coins;

  Data({
    required this.userId,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.password,
    required this.photo,
    required this.token,
    required this.firebaseToken,
    required this.lastUpdated,
    required this.createdAtUser,
    required this.loginType,
    required this.loged,
    required this.socialId,
    required this.userStatus,
    required this.userCurrentCityId,
    required this.coins,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["UserID"],
        fName: json["FName"],
        lName: json["LName"],
        email: json["Email"],
        phone: json["Phone"],
        password: json["Password"],
        photo: json["Photo"],
        token: json["Token"],
        firebaseToken: json["FirebaseToken"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        createdAtUser: DateTime.parse(json["CreatedAtUser"]),
        loginType: json["LoginType"],
        loged: json["Loged"],
        socialId: json["SocialID"],
        userStatus: json["UserStatus"],
        userCurrentCityId: json["UserCurrentCityID"],
        coins: json["Coins"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "FName": fName,
        "LName": lName,
        "Email": email,
        "Phone": phone,
        "Password": password,
        "Photo": photo,
        "Token": token,
        "FirebaseToken": firebaseToken,
        "lastUpdated": lastUpdated.toIso8601String(),
        "CreatedAtUser": createdAtUser.toIso8601String(),
        "LoginType": loginType,
        "Loged": loged,
        "SocialID": socialId,
        "UserStatus": userStatus,
        "UserCurrentCityID": userCurrentCityId,
        "Coins": coins,
      };
}
