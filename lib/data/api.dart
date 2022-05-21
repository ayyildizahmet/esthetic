import 'dart:convert';
import 'package:http/http.dart';
import 'model/user_login_request_model.dart';
import 'model/user_login_response_model.dart';

class ApiService {
  final String loginURL = "https://reqres.in/api/login";

  Future<UserLoginResponseModel> login(UserLoginRequestModel userLoginRequestModel) async {
    print(userLoginRequestModel.toJson());
    Response res = await post(Uri.parse(loginURL), body: userLoginRequestModel.toJson());

    if (res.statusCode == 200) {
      UserLoginResponseModel posts = UserLoginResponseModel.fromJson(jsonDecode(res.body));
      print(posts.token.toString());
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
