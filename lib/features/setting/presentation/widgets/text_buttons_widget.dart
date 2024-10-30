import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_button_widget.dart';

class TextButtonsWidget extends ConsumerWidget {
  const TextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 카카오톡 로그아웃
    Future<void> logout() async {
      final authNotifier = ref.read(authProvider);

      try {
        await UserApi.instance.logout();
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
          title: '기프티콘 보관함',
          actionOnTap: () => {},
        ),
        const DividerWithPaddingWidget(),
        TextButtonWidget(
          title: '결제 내역',
          actionOnTap: () => {},
        ),
        const VerticalGapWidget(),
        TextButtonWidget(
          title: '포인트 내역',
          actionOnTap: () => {},
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
