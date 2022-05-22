import 'dart:convert';

import 'package:esthetic/data/model/base_response_model.dart';

List<UserLoginResponseModel> userFromJson(String str) => List<UserLoginResponseModel>.from(json.decode(str).map((x) => UserLoginResponseModel.fromJson(x)));
String userToJson(List<UserLoginResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginResponseModel extends BaseResponseModel {
  String? token;

  UserLoginResponseModel({
    success,
    message,
    this.token,
  }) : super(
          success: success,
          message: message,
        );

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) => UserLoginResponseModel(
        success: json["success"],
        message: json["message"],
        token: json["data"]["security"]["token"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token
      };
}
