import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/auth/presentation/widgets/social_login_button_widget.dart';

class AppleLoginButtonWidget extends ConsumerWidget {
  const AppleLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final authNotifier = ref.read(authProvider);

    Future<void> signInWithApple() async {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // ignore: avoid_print
      print(credential);
    }

    return SocialLoginButtonWidget(
      iconData: Icons.apple,
      text: 'Apple로 계속하기',
      backgroundColor: Colors.black,
      textColor: Colors.white,
      onTap: signInWithApple,
    );
  }
}
