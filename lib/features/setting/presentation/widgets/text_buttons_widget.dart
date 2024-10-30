import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_button_widget.dart';

class TextButtonsWidget extends ConsumerWidget {
  const TextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 카카오톡 로그아웃
    Future<void> logout() async {
      final authNotifier = ref.read(authProvider);

      if (authNotifier.getPlatform() == Platform.kakao) {
        await UserApi.instance.logout();
      }

      await authNotifier.logout();
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
