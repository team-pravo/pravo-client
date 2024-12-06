import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/oauth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_button_widget.dart';

class TextButtonsWidget extends ConsumerWidget {
  const TextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 카카오톡 & 애플 로그아웃
    Future<void> logout() async {
      final oauthNotifier = ref.read(oauthProvider);
      final authNotifier = ref.read(authProvider);

      if (oauthNotifier.getPlatform() == Platform.kakao) {
        await UserApi.instance.logout();
      }

      await oauthNotifier.logout();
      await authNotifier.logout();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButtonWidget(
          title: '기프티콘 보관함',
          actionOnTap: () => {},
        ),
        const DividerWithPaddingWidget(),
        TextButtonWidget(
          title: '결제 내역',
          actionOnTap: () => context.push('/payment-log'),
        ),
        const VerticalGapWidget(),
        TextButtonWidget(
          title: '포인트 내역',
          actionOnTap: () => context.push('/point-log'),
        ),
        const DividerWithPaddingWidget(),
        TextButtonWidget(
          title: '약관 및 정책',
          actionOnTap: () => {},
        ),
        const DividerWithPaddingWidget(),
        TextButtonWidget(
          title: '로그아웃',
          actionOnTap: logout,
        ),
        const VerticalGapWidget(),
        TextButtonWidget(
          title: '탈퇴하기',
          actionOnTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
              title: '정말 탈퇴하시겠습니까?',
              content: '탈퇴 버튼 선택 시, \n계정은 삭제되며 복구되지 않아요.',
              actionOnPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('성공적으로 탈퇴되었습니다.')),
                );
                Navigator.of(context).pop();
              },
              actionTitle: '탈퇴하기',
            ),
          ),
        ),
      ],
    );
  }
}
