import 'dart:convert';

List<FeedResponseModel> userFromJson(String str) =>
    List<FeedResponseModel>.from(
        json.decode(str).map((x) => FeedResponseModel.fromJson(x)));
String userToJson(List<FeedResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedResponseModel {
  String username;
  String profileImageUrl;
  String? content;
  List<String>? mediaList;
  String clinic;
  String operationType;
  int? viewCount;
  int? likeCount;
  int? forumId;

  FeedResponseModel(
      {required username,
      required profileImageUrl,
      required clinic,
      required operationType,
      content,
      mediaList,
      viewCount,
      forumId,
      likeCount});

  factory FeedResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedResponseModel(
        username: json["username"],
        profileImageUrl: json["profileImageUrl"],
        clinic: json["clinic"],
        operationType: json["operationType"],
        content: json["content"],
        mediaList: json["mediaList"],
        viewCount: json["viewCount"],
        forumId: json["forumId"],
        likeCount: json["likeCount"],
      );

  Map<String, dynamic> toJson() =>
      {"username": username, "profileImageUrl": profileImageUrl};
}
