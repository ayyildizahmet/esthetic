import 'dart:convert';
import 'package:esthetic/data/model/base_response_model.dart';

List<ForgotPasswordResponseModel> userFromJson(String str) => List<ForgotPasswordResponseModel>.from(json.decode(str).map((x) => ForgotPasswordResponseModel.fromJson(x)));
String userToJson(List<ForgotPasswordResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForgotPasswordResponseModel extends BaseResponseModel {
  String? token;

  ForgotPasswordResponseModel({
    success,
    message,
  }) : super(
          success: success,
          message: message,
        );

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) => ForgotPasswordResponseModel(
        success: json["success"],
        message: json["message"],
      );
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
