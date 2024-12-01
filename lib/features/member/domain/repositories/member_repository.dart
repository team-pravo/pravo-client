import 'package:dio/dio.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';

abstract class MemberRepository {
  Future<Member> getMember(int id);
  Future<void> editMember({
    required String name,
    MultipartFile? file,
    required bool resetToDefaultImage,
  });
}
