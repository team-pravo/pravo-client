import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/member/data/repositories/member_repository_impl.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';
import 'package:pravo_client/features/member/domain/repositories/member_repository.dart';

final memberViewModelProvider =
    StateNotifierProvider<MemberViewModel, AsyncValue<Member>>((ref) {
  return MemberViewModel(memberRepository: ref.watch(memberRepositoryProvider));
});

class MemberViewModel extends StateNotifier<AsyncValue<Member>> {
  final MemberRepository memberRepository;
  final _secureStorage = const FlutterSecureStorage();

  MemberViewModel({
    required this.memberRepository,
  }) : super(const AsyncValue.loading());

  Future<void> getMember() async {
    final memberId = await _secureStorage.read(key: 'member_id');
    if (memberId == null) {
      state = AsyncValue.error(
        'Member ID not found in secure storage',
        StackTrace.current,
      );
      return;
    }
    final member = await memberRepository.getMember(int.parse(memberId));
    state = AsyncValue.data(member);
  }
}
