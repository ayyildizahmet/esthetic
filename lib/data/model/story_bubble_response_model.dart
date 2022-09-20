import 'dart:convert';

// List<StoryBubbleResponseModel> userFromJson(String str) =>
//     List<StoryBubbleResponseModel>.from(
//         json.decode(str).map((x) => StoryBubbleResponseModel.fromJson(x)));
// String userToJson(List<StoryBubbleResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryBubbleResponseModel {
  String name;
  String logoUrl;

  StoryBubbleResponseModel({required this.name, required this.logoUrl});

  factory StoryBubbleResponseModel.fromJson(Map<String, dynamic> json) =>
      StoryBubbleResponseModel(
          name: json["name"], logoUrl: json["image"]?["url"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
