import 'dart:convert';
import 'package:esthetic/data/model/operation_type_response_model.dart';

List<FeedResponseModel> userFromJson(String str) =>
    List<FeedResponseModel>.from(
        json.decode(str).map((x) => FeedResponseModel.fromJson(x)));
String userToJson(List<FeedResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedResponseModel {
  String? username;
  String? profileImageUrl;
  String? content;
  String? clinic;
  OperationTypeResponseModel? operationType;
  int? viewCount;
  int? likeCount;
  int? forumId;
  List<String>? mediaList;

  FeedResponseModel(
      {username,
      profileImageUrl,
      clinic,
      operationType,
      content,
      viewCount,
      forumId,
      likeCount,
      mediaList});

  factory FeedResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedResponseModel(
        username: json["username"],
        profileImageUrl: json["profileImageUrl"],
        clinic: json["clinic"],
        operationType: json["operationType"],
        content: json["content"],
        viewCount: json["viewCount"],
        forumId: json["forumId"],
        likeCount: json["likeCount"],
        mediaList: json["mediaList"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profileImageUrl": profileImageUrl,
        "clinic": clinic,
        "operationType": operationType,
        "content": content,
        "viewCount": viewCount,
        "forumId": forumId,
        "likeCount": likeCount,
        "mediaList": mediaList,
      };
}
