import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/user_provider.dart';
import 'package:pravo_client/features/auth/presentation/widgets/kakao_login_button_widget.dart';

import 'social_login_button_widget.dart';

class SocialLoginButtonsWidget extends ConsumerWidget {
  const SocialLoginButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SocialLoginButtonWidget(
          iconData: Icons.apple,
          text: 'Apple로 계속하기',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onTap: () =>
              ref.read(userProvider.notifier).appleLogin(name: '나는애플유저'),
        ),
        const SizedBox(height: 16),
        const KakaoLoginButtonWidget(),
      ],
    );
  }
}
