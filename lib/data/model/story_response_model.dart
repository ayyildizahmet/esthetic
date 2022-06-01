import 'dart:convert';
import 'package:esthetic/data/model/base_response_model.dart';

List<StoryResponseModel> userFromJson(String str) => List<StoryResponseModel>.from(json.decode(str).map((x) => StoryResponseModel.fromJson(x)));
String userToJson(List<StoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryResponseModel extends BaseResponseModel {
  String? name;
  String? logoUrl;

  StoryResponseModel({success, message, this.name, this.logoUrl})
      : super(
          success: success,
          message: message,
        );

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) => StoryResponseModel(success: json["success"], message: json["message"], name: json["data"]?["name"], logoUrl: json["data"]?["logoUrl"]);
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "name": name,
        "logoUrl": logoUrl
      };
}
