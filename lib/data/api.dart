import 'dart:convert';
import 'package:esthetic/data/model/user_signup_request_model.dart';
import 'package:esthetic/data/model/user_signup_response_model.dart';
import 'package:http/http.dart';
import 'model/user_login_request_model.dart';
import 'model/user_login_response_model.dart';

class ApiService {
  final String loginURL = "http://ayyildiz.xyz:8090/api/auth/login"; //"https://reqres.in/api/login";

  Future<UserLoginResponseModel> login(UserLoginRequestModel userLoginRequestModel) async {
    print(userLoginRequestModel.toJson());
    Response res = await post(Uri.parse(loginURL),
            headers: {
              "Content-Type": "application/json"
            },
            body: jsonEncode(userLoginRequestModel.toJson()))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserLoginResponseModel posts = UserLoginResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<UserSignupResponseModel> signup(UserSignupRequestModel userSignupRequestModel) async {
    Response res = await post(Uri.parse(loginURL), body: userSignupRequestModel.toJson()).timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserSignupResponseModel posts = UserSignupResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
