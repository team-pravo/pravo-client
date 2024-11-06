class LoginResponseModel {
  TokenResponseModel jwtTokens;

  LoginResponseModel({
    required this.jwtTokens,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      jwtTokens: TokenResponseModel.fromJson(json['jwtTokens']),
    );
  }
}

class TokenResponseModel {
  String accessToken;
  String grantType;
  int expiresIn;

  TokenResponseModel({
    required this.accessToken,
    required this.grantType,
    required this.expiresIn,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    return TokenResponseModel(
      accessToken: json['accessToken'],
      grantType: json['grantType'],
      expiresIn: json['expiresIn'],
    );
  }
}
