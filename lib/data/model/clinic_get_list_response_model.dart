import 'dart:convert';

// List<ClinicResponseModel> userFromJson(String str) =>
//     List<ClinicResponseModel>.from(
//         json.decode(str).map((x) => ClinicResponseModel.fromJson(x)));
// String userToJson(List<ClinicResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicResponseModel {
  //int? id;
  String? name;
  //String? logoUrl;

  ClinicResponseModel({this.name});

  factory ClinicResponseModel.fromJson(Map<String, dynamic> json) => ClinicResponseModel(name: json["name"]);

  // Map<String, dynamic> toJson() => {"name": name, "logoUrl": logoUrl};
}
