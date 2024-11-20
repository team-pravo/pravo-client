import 'package:pravo_client/features/member/domain/entities/member.dart';

abstract class MemberRepository {
  Future<Member> getMember(int id);
}
