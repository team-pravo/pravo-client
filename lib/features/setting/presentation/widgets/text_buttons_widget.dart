import 'package:flutter/material.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_button_widget.dart';

class TextButtonsWidget extends StatelessWidget {
  const TextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          actionOnTap: () => {},
        ),
        TextButtonWidget(
          title: '탈퇴하기',
          actionOnTap: () => {},
        ),
      ],
    );
  }
}
