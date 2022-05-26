import 'dart:convert';

List<ForgotPasswordRequestModel> userFromJson(String str) => List<ForgotPasswordRequestModel>.from(json.decode(str).map((x) => ForgotPasswordRequestModel.fromJson(x)));
String userToJson(List<ForgotPasswordRequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForgotPasswordRequestModel {
  ForgotPasswordRequestModel({required this.email});

  String email;

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) => ForgotPasswordRequestModel(email: json["email"]);

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
