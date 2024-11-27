class LoginResponseModel {
  TokenResponseModel jwtTokens;
  int memberId;

  LoginResponseModel({
    required this.jwtTokens,
    required this.memberId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      jwtTokens: TokenResponseModel.fromJson(json['jwtTokens']),
      memberId: json['memberId'],
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
