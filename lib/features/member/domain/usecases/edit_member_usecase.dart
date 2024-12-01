import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';
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
      final compressedFile = await _convertAndCompressToJpeg(file);

      final mimeType =
          lookupMimeType(compressedFile.path) ?? 'application/octet-stream';
      final mimeTypeSplit = mimeType.split('/');
      final profileImageFile = await MultipartFile.fromFile(
        compressedFile.path,
        filename: compressedFile.path.split('/').last,
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

  Future<File> _convertAndCompressToJpeg(File file) async {
    const uuid = Uuid();
    File compressedFile = file;
    int quality = 85;

    do {
      final targetPath = '${file.parent.path}/compressed_${uuid.v4()}.jpg';
      final compressedXFile = await FlutterImageCompress.compressAndGetFile(
        compressedFile.path,
        targetPath,
        format: CompressFormat.jpeg,
        quality: quality,
      );
      compressedFile = File(compressedXFile!.path);
      quality -= 5;
    } while (compressedFile.lengthSync() >
        1024 * 1024); // FIXME: 추후 서버 nginx 문제가 해결되면 1MB보다 큰 값으로 수정 필요함

    return compressedFile;
  }
}
