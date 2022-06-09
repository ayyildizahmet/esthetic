import 'dart:convert';

// List<ClinicResponseModel> userFromJson(String str) =>
//     List<ClinicResponseModel>.from(
//         json.decode(str).map((x) => ClinicResponseModel.fromJson(x)));
// String userToJson(List<ClinicResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicResponseModel {
  String? id;
  String? name;
  //String? logoUrl;

  ClinicResponseModel({this.id, this.name});

  factory ClinicResponseModel.fromJson(Map<String, dynamic> json) => ClinicResponseModel(id: json["id"], name: json["name"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
