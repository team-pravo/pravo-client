import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/member/data/repositories/member_repository_impl.dart';
import 'package:pravo_client/features/member/domain/usecases/edit_member_usecase.dart';

final editMemberViewModelProvider =
    StateNotifierProvider<EditMemberViewModel, AsyncValue<void>>((ref) {
  return EditMemberViewModel(
    editMemberUseCase: EditMemberUseCase(ref.watch(memberRepositoryProvider)),
  );
});

class EditMemberViewModel extends StateNotifier<AsyncValue<void>> {
  final EditMemberUseCase editMemberUseCase;
  String? errorMessage;

  EditMemberViewModel({
    required this.editMemberUseCase,
  }) : super(const AsyncValue.loading());

  Future<void> editMember({
    required String name,
    File? file,
    required bool resetToDefaultImage,
  }) async {
    state = const AsyncValue.loading();
    errorMessage = null;

    try {
      await editMemberUseCase.editMember(
        name: name,
        file: file,
        resetToDefaultImage: resetToDefaultImage,
      );

      state = const AsyncValue.data(null);
    } on DioException catch (e, st) {
      if (e.response?.data['code'] == 'E09') {
        errorMessage = '이미 사용 중인 닉네임이에요.';
      } else if (e.response?.data['code'] == 'E07') {
        errorMessage = '이미지 확장자는 jpg, png, webp만 가능합니다.';
      } else {
        errorMessage = '프로필 수정 중 문제가 발생했습니다.';
      }
      state = AsyncValue.error(e, st);
    }
  }
}
