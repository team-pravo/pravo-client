import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/member/data/models/member_model.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';
import 'package:pravo_client/features/member/domain/repositories/member_repository.dart';

final memberRepositoryProvider = Provider<MemberRepository>((ref) {
  return MemberRepositoryImpl(ref.read(dioProvider));
});

class MemberRepositoryImpl implements MemberRepository {
  final Dio dio;

  MemberRepositoryImpl(this.dio);

  @override
  Future<Member> getMember(int memberId) async {
    final response = await dio.get('/api/member');
    final memberDto = MemberModel.fromJson(response.data);
    return memberDto.toEntity(memberId);
  }

  @override
  Future<void> editMember({
    required String name,
    MultipartFile? file,
    required bool resetToDefaultImage,
  }) async {
    await dio.patch(
      '/api/member/profile',
      data: {
        name,
        file,
        resetToDefaultImage,
      },
    );
  }
}
