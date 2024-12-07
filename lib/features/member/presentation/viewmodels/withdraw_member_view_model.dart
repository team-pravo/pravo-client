import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/member/data/repositories/member_repository_impl.dart';
import 'package:pravo_client/features/member/domain/usecases/withdraw_member_usecase.dart';

final withdrawMemberViewModelProvider =
    StateNotifierProvider<WithdrawMemberViewModel, void>((ref) {
  return WithdrawMemberViewModel(
    withdrawMemberUsecase:
        WithdrawMemberUsecase(ref.watch(memberRepositoryProvider)),
  );
});

class WithdrawMemberViewModel extends StateNotifier<void> {
  final WithdrawMemberUsecase withdrawMemberUsecase;

  WithdrawMemberViewModel({
    required this.withdrawMemberUsecase,
  }) : super(null);

  Future<void> withdrawMember() async {
    try {
      await withdrawMemberUsecase.withdrawMember();
    } on DioException catch (dioError, _) {
      final errorMessage =
          dioError.response?.data['message'] ?? '알 수 없는 오류가 발생했습니다.';
      throw Exception(errorMessage);
    } catch (e, _) {
      throw Exception('알 수 없는 오류가 발생했습니다.');
    }
  }
}
