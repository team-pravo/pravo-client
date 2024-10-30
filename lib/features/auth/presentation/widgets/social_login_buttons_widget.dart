import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/presentation/widgets/apple_login_button_widget.dart';
import 'package:pravo_client/features/auth/presentation/widgets/kakao_login_button_widget.dart';

class SocialLoginButtonsWidget extends ConsumerWidget {
  const SocialLoginButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        AppleLoginButtonWidget(),
        SizedBox(height: 16),
        KakaoLoginButtonWidget(),
      ],
    );
  }
}
