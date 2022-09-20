import 'dart:convert';

List<FeedRequestModel> feedFromJson(String str) => List<FeedRequestModel>.from(
    json.decode(str).map((x) => FeedRequestModel.fromJson(x)));
String feedToJson(List<FeedRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedRequestModel {
  FeedRequestModel({required this.id});

  int id;

  factory FeedRequestModel.fromJson(Map<String, dynamic> json) =>
      FeedRequestModel(id: json["id"]);

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
