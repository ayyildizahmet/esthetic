import 'dart:convert';

List<UserSignupResponseModel> userFromJson(String str) => List<UserSignupResponseModel>.from(json.decode(str).map((x) => UserSignupResponseModel.fromJson(x)));
String userToJson(List<UserSignupResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserSignupResponseModel {
  UserSignupResponseModel({required this.isSuccess});

  bool isSuccess;

  factory UserSignupResponseModel.fromJson(Map<String, dynamic> json) => UserSignupResponseModel(
        isSuccess: json["isSuccess"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess
      };
}
