import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/profile_preview_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_button_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: "설정",
        actionIcon: Icons.notifications_none_outlined,
        actionOnPressed: () => {},
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfilePreviewWidget(),
            const SizedBox(height: 30),
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
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
