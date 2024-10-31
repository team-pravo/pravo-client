import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_button_widget.dart';

class TextButtonsWidget extends ConsumerWidget {
  const TextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 카카오톡 & 애플 로그아웃
    Future<void> logout() async {
      final authNotifier = ref.read(authProvider);

      try {
        // await UserApi.instance.logout();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('로그아웃 성공, SDK에서 토큰 삭제')),
        );
        await authNotifier.logout(); // 로그아웃 시 AuthNotifier의 상태 업데이트
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('카카오톡으로 로그인 실패 $error')));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButtonWidget(
          title: '프로필 설정',
          actionOnTap: () => {},
        ),
        TextButtonWidget(
          title: '내 기프티콘 보관함',
          actionOnTap: () => {},
        ),
        TextButtonWidget(
          title: '결제 내역',
          actionOnTap: () => {},
        ),
        TextButtonWidget(
          title: '포인트 적립/사용 내역',
          actionOnTap: () => {},
        ),
        TextButtonWidget(
          title: '약관 및 정책',
          actionOnTap: () => {},
        ),
        TextButtonWidget(
          title: '로그아웃',
          actionOnTap: logout,
        ),
        TextButtonWidget(
          title: '탈퇴하기',
          actionOnTap: () => {},
        ),
      ],
    );
  }
}
