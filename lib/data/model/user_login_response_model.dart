import 'dart:convert';

List<UserLoginResponseModel> userFromJson(String str) => List<UserLoginResponseModel>.from(json.decode(str).map((x) => UserLoginResponseModel.fromJson(x)));
String userToJson(List<UserLoginResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginResponseModel {
  UserLoginResponseModel({required this.id, required this.firstname, required this.lastname, required this.email, required this.token});

  int id;
  String firstname;
  String lastname;
  String email;
  String token;

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) => UserLoginResponseModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "token": token
      };
}
