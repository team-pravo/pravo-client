import 'package:pravo_client/features/member/domain/entities/member.dart';
import 'package:pravo_client/features/member/domain/repositories/member_repository.dart';

class GetMemberUseCase {
  final MemberRepository repository;

  GetMemberUseCase(this.repository);

  Future<Member> getMember(int id) {
    return repository.getMember(id);
  }
}
