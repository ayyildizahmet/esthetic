import 'dart:convert';
import 'base_response_model.dart';

List<PostResponseModel> userFromJson(String str) =>
    List<PostResponseModel>.from(
        json.decode(str).map((x) => PostResponseModel.fromJson(x)));
String userToJson(List<PostResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResponseModel extends BaseResponseModel {
  String? username;
  String? profileImageUrl;
  String? content;
  List<String>? mediaList;
  String? clinic;
  String? operationType;
  int? viewCount;
  int? likeCount;
  int? forumId;

  PostResponseModel(
      {success,
      message,
      username,
      profileImageUrl,
      content,
      mediaList,
      clinic,
      operationType,
      viewCount,
      likeCount})
      : super(success: success, message: message);

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      PostResponseModel(
          username: json["username"],
          profileImageUrl: json["profileImageUrl"],
          content: json["content"],
          mediaList: json["mediaList"],
          clinic: json["clinic"],
          operationType: json["operationType"],
          viewCount: json["viewCount"],
          likeCount: json["likeCount"],
          success: json["success"],
          message: json["message"]);

  Map<String, dynamic> toJson() => {
        "username": username,
        "profileImageUrl": profileImageUrl,
        "content": content,
        "mediaList": mediaList,
        "clinic": clinic,
        "operationType": operationType,
        "viewCount": viewCount,
        "likeCount": likeCount,
      };
}
