import 'dart:convert';

List<UserSignupRequestModel> userFromJson(String str) => List<UserSignupRequestModel>.from(json.decode(str).map((x) => UserSignupRequestModel.fromJson(x)));
String userToJson(List<UserSignupRequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserSignupRequestModel {
  UserSignupRequestModel({required this.email, required this.firstname, required this.lastname, required this.phone, required this.password});

  String email;
  String firstname;
  String lastname;
  String phone;
  String password;

  factory UserSignupRequestModel.fromJson(Map<String, dynamic> json) => UserSignupRequestModel(email: json["email"], firstname: json["firstname"], lastname: json["lastname"], phone: json["phone"], password: json["password"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "password": password
      };
}
