import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:pravo_client/features/member/domain/repositories/member_repository.dart';

class EditMemberUseCase {
  final MemberRepository repository;

  EditMemberUseCase(this.repository);

  Future<void> editMember({
    required String name,
    File? file,
    required bool resetToDefaultImage,
  }) async {
    if (file != null) {
      final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';
      final mimeTypeSplit = mimeType.split('/');
      final profileImageFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType(mimeTypeSplit[0], mimeTypeSplit[1]),
      );
      return repository.editMember(
        name: name,
        file: profileImageFile,
        resetToDefaultImage: resetToDefaultImage,
      );
    }

    return repository.editMember(
      name: name,
      resetToDefaultImage: resetToDefaultImage,
    );
  }
}
