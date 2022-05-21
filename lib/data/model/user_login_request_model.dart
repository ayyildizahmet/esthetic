import 'dart:convert';

List<UserLoginRequestModel> userFromJson(String str) => List<UserLoginRequestModel>.from(json.decode(str).map((x) => UserLoginRequestModel.fromJson(x)));
String userToJson(List<UserLoginRequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginRequestModel {
  UserLoginRequestModel({required this.email, required this.password});

  String email;
  String password;

  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) => UserLoginRequestModel(email: json["email"], password: json["password"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password
      };
}
