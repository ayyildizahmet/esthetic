import 'dart:convert';

List<PostRequestModel> userFromJson(String str) => List<PostRequestModel>.from(
    json.decode(str).map((x) => PostRequestModel.fromJson(x)));
String userToJson(List<PostRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostRequestModel {
  int id;

  PostRequestModel({required this.id});

  factory PostRequestModel.fromJson(Map<String, dynamic> json) =>
      PostRequestModel(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id};
}
