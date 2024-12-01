import 'package:dio/dio.dart';
import 'package:pravo_client/features/member/domain/repositories/member_repository.dart';

class EditMemberUseCase {
  final MemberRepository repository;

  EditMemberUseCase(this.repository);

  Future<void> editMember({
    required String name,
    MultipartFile? file,
    required bool resetToDefaultImage,
  }) {
    return repository.editMember(
      name: name,
      file: file,
      resetToDefaultImage: resetToDefaultImage,
    );
  }
}
