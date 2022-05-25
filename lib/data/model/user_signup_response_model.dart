import 'dart:convert';

List<UserSignupResponseModel> userFromJson(String str) => List<UserSignupResponseModel>.from(json.decode(str).map((x) => UserSignupResponseModel.fromJson(x)));
String userToJson(List<UserSignupResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserSignupResponseModel extends BaseResponseModel {
  UserSignupResponseModel({success, message, required this.isSuccess})
      : super(
          success: success,
          message: message,
        );

  bool isSuccess;

  factory UserSignupResponseModel.fromJson(Map<String, dynamic> json) => UserSignupResponseModel(
        success: json["success"],
        message: json["message"],
        isSuccess: json["isSuccess"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "isSuccess": isSuccess
      };
}
