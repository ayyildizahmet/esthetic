import 'dart:convert';
import 'package:http/http.dart';
import 'package:esthetic/data/model/clinic_get_list_response_model.dart';
import 'package:esthetic/data/model/user_login_request_model.dart';
import 'package:esthetic/data/model/user_login_response_model.dart';
import 'package:esthetic/data/model/user_signup_request_model.dart';
import 'package:esthetic/data/model/user_signup_response_model.dart';
import 'package:esthetic/data/model/user_forgot_password_request_model.dart';
import 'package:esthetic/data/model/user_forgot_password_response_model.dart';
import 'package:esthetic/data/model/story_bubble_response_model.dart';
import 'package:esthetic/data/model/operation_type_response_model.dart';
import 'package:esthetic/data/model/feed_request_model.dart';
import 'package:esthetic/data/model/feed_response_model.dart';

class ApiService {
  final String baseURL = "http://212.125.21.124:8090/";

  final String loginURL = "api/auth/login";
  final String signupURL = "api/auth/register";
  final String forgotPasswordURL = "api/auth/forgotpassword";
  final String getCompanies = "api/company/getlist";
  final String getOperationTypes = "api/operationtype/getlist";
  final String getOperations = "api/operation/getlist"; //TODO
  final String getOperation = "api/operation/get"; //TODO
  final String getFeedPath = "api/feed/get"; //TODO
  final String getFeedListPath = "api/feed/getlist"; //TODO

  Future<UserLoginResponseModel> login(UserLoginRequestModel request) async {
    Response res = await post(Uri.parse(baseURL + loginURL),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(request))
        .timeout(const Duration(seconds: 15));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserLoginResponseModel posts =
          UserLoginResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<UserSignupResponseModel> signup(UserSignupRequestModel request) async {
    Response res = await post(Uri.parse(baseURL + signupURL),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(request))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserSignupResponseModel posts =
          UserSignupResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<ForgotPasswordResponseModel> forgotPassword(
      ForgotPasswordRequestModel request) async {
    Response res = await post(Uri.parse(baseURL + forgotPasswordURL),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(request))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode == 200 || res.statusCode == 400) {
      ForgotPasswordResponseModel posts =
          ForgotPasswordResponseModel.fromJson(jsonDecode(res.body));
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<StoryBubbleResponseModel>> getStoryBubbles() async {
    Response res = await get(
      Uri.parse(baseURL + getOperationTypes),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 15));
    if (res.statusCode == 200 || res.statusCode == 400) {
      List<StoryBubbleResponseModel> stories = <StoryBubbleResponseModel>[];
      Iterable list = json.decode(res.body)['data'];
      stories = list
          .map((model) => StoryBubbleResponseModel.fromJson(model))
          .toList();

      return stories;
    } else {
      throw "Unable to retrieve get.";
    }
  }

  Future<List<ClinicResponseModel>> getClinicList() async {
    Response res = await get(
      Uri.parse(baseURL + getCompanies),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 15));
    if (res.statusCode == 200 || res.statusCode == 400) {
      List<ClinicResponseModel> clinics = <ClinicResponseModel>[];
      Iterable list = json.decode(res.body)['data'];
      clinics =
          list.map((model) => ClinicResponseModel.fromJson(model)).toList();
      return clinics;
    } else {
      throw "Unable to retrieve get.";
    }
  }

  Future<List<OperationTypeResponseModel>> getOperationTypeList() async {
    Response res = await get(
      Uri.parse(baseURL + getOperationTypes),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 15));
    if (res.statusCode == 200 || res.statusCode == 400) {
      List<OperationTypeResponseModel> operationTypes =
          <OperationTypeResponseModel>[];

      Iterable list = json.decode(res.body)['data'];
      operationTypes = list
          .map((model) => OperationTypeResponseModel.fromJson(model))
          .toList();

      return operationTypes;
    } else {
      throw "Unable to retrieve get.";
    }
  }

  Future<FeedResponseModel> getFeed(FeedRequestModel request) async {
    //Response res = await post(Uri.parse(baseURL + getFeedPath),
    //        headers: {"Content-Type": "application/json"},
    //        body: jsonEncode(request))
    //    .timeout(const Duration(seconds: 15));
    //if (res.statusCode == 200 || res.statusCode == 400) {
    //  FeedResponseModel feed = FeedResponseModel.fromJson(jsonDecode(res.body));
    List<FeedResponseModel> feeds = await getFeedList();
    return feeds.firstWhere((element) => element.id == request.id);
    //} else {
    //  throw "Unable to retrieve posts.";
    // }
  }

  Future<List<FeedResponseModel>> getFeedList() async {
    //Response res = await post(Uri.parse(baseURL + getFeedListPath), headers: {"Content-Type": "application/json"}, body: jsonEncode(request)).timeout(const Duration(seconds: 15));
    //if (res.statusCode == 200 || res.statusCode == 400) {
    List<FeedResponseModel> feedList = <FeedResponseModel>[];
    feedList.add(FeedResponseModel(
        id: 1,
        clinic: "Esteworld",
        content: "Hair Transplant",
        forumId: 50,
        likeCount: 10,
        operationType: OperationTypeResponseModel(id: 1, name: "Saç Ekimi"),
        username: "test user1",
        viewCount: 3860,
        profileImageUrl:
            "https://icons.iconarchive.com/icons/graphicloads/medical-health/256/hospital-icon.png",
        mediaList: [
          "https://natural.clinic/wp-content/uploads/2021/08/hair-transplant-before-after.jpg",
          "https://natural.clinic/wp-content/uploads/2021/08/hair-transplant-before-after-2.jpg"
        ]));
    feedList.add(FeedResponseModel(
        id: 2,
        clinic: "Akl Klinik",
        content: "Hair Transplant",
        forumId: 30,
        likeCount: 20,
        operationType: OperationTypeResponseModel(id: 1, name: "Saç Ekimi"),
        username: "test user2",
        viewCount: 3450,
        profileImageUrl:
            "https://icons.iconarchive.com/icons/dapino/medical/256/hospital-icon.png",
        mediaList: [
          "https://natural.clinic/wp-content/uploads/2021/08/hair-transplant-before-after-4.jpg",
          "https://natural.clinic/wp-content/uploads/2021/08/hair-transplant-before-after-3.jpg"
        ]));
    feedList.add(FeedResponseModel(
        id: 3,
        clinic: "Este Center",
        content: "Hair Transplant",
        forumId: 20,
        likeCount: 18,
        operationType: OperationTypeResponseModel(id: 1, name: "Saç Ekimi"),
        username: "test user3",
        viewCount: 320,
        profileImageUrl:
            "https://icons.iconarchive.com/icons/medicalwp/medical/256/Hospital-blue-icon.png",
        mediaList: [
          "https://natural.clinic/wp-content/uploads/2021/08/hair-transplant-before-after-6.jpg",
          "https://natural.clinic/wp-content/uploads/2021/08/hair-transplant-before-after-5.jpg"
        ]));
    feedList.add(FeedResponseModel(
        id: 4,
        clinic: "Estemylife",
        content: "Face Lift Operation",
        forumId: 0,
        likeCount: 36,
        operationType: OperationTypeResponseModel(id: 1, name: "Saç Ekimi"),
        username: "test user4",
        viewCount: 220,
        profileImageUrl:
            "https://icons.iconarchive.com/icons/streamlineicons/streamline-ux-free/256/doctor-hospital-icon.png",
        mediaList: [
          "https://natural.clinic/wp-content/uploads/2021/06/facelift-9.png",
          "https://natural.clinic/wp-content/uploads/2021/06/facelift-10.png"
        ]));
    //Iterable list = json.decode(res.body)['data'];
    //feedList = list.map((model) => FeedResponseModel.fromJson(model)).toList();
    return feedList;
  }
  //else {
  //  throw "Unable to retrieve get.";
  //}
  //}
}
