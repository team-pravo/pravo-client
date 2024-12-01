import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/member/data/repositories/member_repository_impl.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';
import 'package:pravo_client/features/member/domain/usecases/get_member_usecase.dart';

final getMemberViewModelProvider =
    StateNotifierProvider<GetMemberViewModel, AsyncValue<Member>>((ref) {
  return GetMemberViewModel(
    getMemberUseCase: GetMemberUseCase(ref.watch(memberRepositoryProvider)),
  );
});

class GetMemberViewModel extends StateNotifier<AsyncValue<Member>> {
  final GetMemberUseCase getMemberUseCase;
  final _secureStorage = const FlutterSecureStorage();

  GetMemberViewModel({
    required this.getMemberUseCase,
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
    final member = await getMemberUseCase.getMember(int.parse(memberId));
    state = AsyncValue.data(member);
  }
}
