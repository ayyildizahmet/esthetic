import 'dart:convert';

// List<StoryBubbleResponseModel> userFromJson(String str) =>
//     List<StoryBubbleResponseModel>.from(
//         json.decode(str).map((x) => StoryBubbleResponseModel.fromJson(x)));
// String userToJson(List<StoryBubbleResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryBubbleResponseModel {
  String? name;
  String? logoUrl;

  StoryBubbleResponseModel({this.name, this.logoUrl});

  factory StoryBubbleResponseModel.fromJson(Map<String, dynamic> json) => StoryBubbleResponseModel(name: json["name"], logoUrl: json["logoUrl"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
