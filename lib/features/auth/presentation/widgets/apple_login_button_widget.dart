import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/oauth_provider.dart';
import 'package:pravo_client/features/auth/presentation/widgets/social_login_button_widget.dart';

class AppleLoginButtonWidget extends ConsumerWidget {
  const AppleLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oauthNotifier = ref.read(oauthProvider);
    final authNotifier = ref.read(authProvider);

    Future<void> handleLoginSuccess(
      String identityToken,
    ) async {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('애플 로그인 성공')),
      );
      await oauthNotifier.login(identityToken, Platform.apple);
      await authNotifier.login(identityToken, Platform.apple);
    }

    void handleLoginError(
      dynamic error,
    ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('애플 로그인 실패: $error')),
      );
    }

    Future<void> signInWithApple() async {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
            clientId: 'pravoClient.pravo.com',
            redirectUri: Uri.parse(
              dotenv.env['APPLE_WEB_AUTHENTICATION_REDIRECT_URI']!,
            ),
          ),
        );

        await handleLoginSuccess(credential.identityToken!);
      } catch (error) {
        handleLoginError(error);
      }
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
