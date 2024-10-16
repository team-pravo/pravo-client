enum Platform {
  apple,
  kakao,
}

class UserModel {
  final String name;
  final Platform platform; // 로그인한 플랫폼

  UserModel({required this.name, required this.platform});
}
