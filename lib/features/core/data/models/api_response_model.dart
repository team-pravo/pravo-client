class ApiResponseModel {
  String message;
  int status;
  String code;
  dynamic data;

  ApiResponseModel({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      message: json['message'],
      status: json['status'],
      code: json['code'],
      data: json['data'],
    );
  }
}
