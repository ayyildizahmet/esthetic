import 'dart:convert';

// List<OperationTypeResponseModel> userFromJson(String str) =>
//     List<OperationTypeResponseModel>.from(
//         json.decode(str).map((x) => OperationTypeResponseModel.fromJson(x)));
// String userToJson(List<OperationTypeResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OperationTypeResponseModel {
  int? id;
  String? name;
  String? url;
  //String? logoUrl;

  OperationTypeResponseModel({this.id, this.name, this.url});

  factory OperationTypeResponseModel.fromJson(Map<String, dynamic> json) => OperationTypeResponseModel(id: json["id"], name: json["name"], url: json["url"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
