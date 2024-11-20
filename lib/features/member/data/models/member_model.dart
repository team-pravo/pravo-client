import 'package:pravo_client/features/member/domain/entities/member.dart';

class MemberModel {
  final String name;
  final String? profileImageUrl;

  MemberModel({required this.name, this.profileImageUrl});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Member toEntity(int memberId) {
    return Member(
      id: memberId,
      name: name,
      profileImageUrl: profileImageUrl,
    );
  }
}
