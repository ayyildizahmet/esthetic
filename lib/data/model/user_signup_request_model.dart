import 'dart:convert';

List<UserSignupRequestModel> userFromJson(String str) =>
    List<UserSignupRequestModel>.from(
        json.decode(str).map((x) => UserSignupRequestModel.fromJson(x)));
String userToJson(List<UserSignupRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserSignupRequestModel {
  UserSignupRequestModel(
      {required this.email,
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.countryCode,
      required this.password});

  String email;
  String firstname;
  String lastname;
  String phone;
  String countryCode;
  String password;

  factory UserSignupRequestModel.fromJson(Map<String, dynamic> json) =>
      UserSignupRequestModel(
          email: json["email"],
          firstname: json["firstname"],
          lastname: json["lastname"],
          phone: json["phone"],
          countryCode: json["countrycode"],
          password: json["password"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "countrycode": countryCode,
        "password": password
      };
}
