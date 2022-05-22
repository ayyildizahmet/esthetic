class BaseResponseModel {
  BaseResponseModel({required this.success, required this.message});

  bool success;
  String message;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        success: json["success"],
        message: json["message"],
      );
}
