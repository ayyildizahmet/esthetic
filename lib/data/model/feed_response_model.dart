import 'dart:convert';

// List<FeedResponseModel> userFromJson(String str) =>
//     List<FeedResponseModel>.from(
//         json.decode(str).map((x) => FeedResponseModel.fromJson(x)));
// String userToJson(List<FeedResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedResponseModel {
  String? username;
  String? profileImageUrl;
  String? content;
  //List<PostMedia>? mediaList;
  String? clinic;
  String? operationType;
  int? viewCount;
  int? likeCount;
  int? forumId;

  //FeedResponseModel({this.name, this.logoUrl});

  //factory FeedResponseModel.fromJson(Map<String, dynamic> json) => FeedResponseModel(name: json["name"], logoUrl: json["logoUrl"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
