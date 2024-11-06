class TokenResponseModel {
  String accessToken;

  TokenResponseModel({
    required this.accessToken,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    return TokenResponseModel(
      accessToken: json['accessToken'],
    );
  }
}
