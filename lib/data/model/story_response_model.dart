import 'dart:convert';

enum MediaType { image, video }

class StoryResponseModel {
  MediaType media;
  String url;
  Duration duration;

  StoryResponseModel({required this.media, required this.url, required this.duration});

  //factory StoryResponseModel.fromJson(Map<String, dynamic> json) => StoryResponseModel(media: json["media"], url: json["url"], duration: ["duration"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
