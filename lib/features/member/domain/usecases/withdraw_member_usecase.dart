import 'package:pravo_client/features/member/domain/repositories/member_repository.dart';

class WithdrawMemberUsecase {
  final MemberRepository repository;

  WithdrawMemberUsecase(this.repository);

  Future<void> withdrawMember() {
    return repository.withdrawMember();
  }
}
