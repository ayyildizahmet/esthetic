import 'dart:convert';
import 'package:esthetic/data/model/base_response_model.dart';

List<StoryResponseModel> userFromJson(String str) => List<StoryResponseModel>.from(json.decode(str).map((x) => StoryResponseModel.fromJson(x)));
String userToJson(List<StoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryResponseModel {
  String? name;
  String? logoUrl;

  StoryResponseModel({this.name, this.logoUrl});

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) => StoryResponseModel(name: json["name"], logoUrl: json["logoUrl"]);
  Map<String, dynamic> toJson() => {
        "name": name,
        "logoUrl": logoUrl
      };
}
