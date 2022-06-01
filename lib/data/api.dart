import 'dart:convert';
import 'package:http/http.dart';
import 'package:esthetic/data/model/user_login_request_model.dart';
import 'package:esthetic/data/model/user_login_response_model.dart';
import 'package:esthetic/data/model/user_signup_request_model.dart';
import 'package:esthetic/data/model/user_signup_response_model.dart';
import 'package:esthetic/data/model/user_forgot_password_request_model.dart';
import 'package:esthetic/data/model/user_forgot_password_response_model.dart';
//import 'package:esthetic/data/model/story_request_model.dart';
import 'package:esthetic/data/model/story_response_model.dart';

class ApiService {
  final String baseURL = "http://ayyildiz.xyz:8090/";
  final String loginURL = "api/auth/login";
  final String signupURL = "api/auth/register";
  final String forgotPasswordURL = "api/auth/forgotpassword";
  final String getCompanies = "api/company/getlist";

  Future<UserLoginResponseModel> login(UserLoginRequestModel request) async {
    Response res = await post(Uri.parse(baseURL + loginURL),
            headers: {
              "Content-Type": "application/json"
            },
            body: jsonEncode(request))
        .timeout(const Duration(seconds: 15));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserLoginResponseModel posts = UserLoginResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<UserSignupResponseModel> signup(UserSignupRequestModel request) async {
    Response res = await post(Uri.parse(baseURL + signupURL),
            headers: {
              "Content-Type": "application/json"
            },
            body: jsonEncode(request))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserSignupResponseModel posts = UserSignupResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<ForgotPasswordResponseModel> forgotPassword(ForgotPasswordRequestModel request) async {
    Response res = await post(Uri.parse(baseURL + forgotPasswordURL),
            headers: {
              "Content-Type": "application/json"
            },
            body: jsonEncode(request))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      ForgotPasswordResponseModel posts = ForgotPasswordResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<StoryResponseModel>> getStories() async {
    Response res = await get(
      Uri.parse(baseURL + getCompanies),
      headers: {
        "Content-Type": "application/json"
      },
    ).timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      List<StoryResponseModel> stories = <StoryResponseModel>[];
      //Iterable list = json.decode(res.body);
      stories = json.decode(res.body)['data'].map((data) => StoryResponseModel.fromJson(data)).toList();
      // stories = list.map((model) => StoryResponseModel.fromJson(model)).toList();

      return stories;
    } else {
      throw "Unable to retrieve get.";
    }
  }
}
