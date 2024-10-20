import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/user_provider.dart';
import 'package:pravo_client/features/auth/presentation/widgets/social_login_button_widget.dart';
import 'package:pravo_client/features/auth/presentation/widgets/text_logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120),
          TextLogo(),
          SizedBox(height: 200),
          SocialLoginButtons(),
        ],
      ),
    );
  }
}

// StatelessWidget 대신 ConsumerWidget을 상속받아서 ref 객체를 전달 받을 수 있음.
class SocialLoginButtons extends ConsumerWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 카카오 로그인 구현
    Future<void> signInWithKakao() async {
      final authNotifier = ref.read(authProvider);

      // 카카오톡 실행 가능 여부 확인 - 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
      if (await isKakaoTalkInstalled()) {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('카카오계정으로 로그인 성공 ')));
          await authNotifier.login(token.accessToken); // 로그인 성공 시 토큰 저장
          // ref.read(userProvider.notifier).kakaoLogin(name: "나는카카오유저");
        } catch (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('카카오톡으로 로그인 실패 $error')));

          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') return;

          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('카카오계정으로 로그인 성공 ')));
            await authNotifier.login(token.accessToken); // 로그인 성공 시 토큰 저장
            // ref.read(userProvider.notifier).kakaoLogin(name: "나는카카오유저");
          } catch (error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('카카오톡으로 로그인 실패 $error')));
          }
        }
      } else {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('카카오계정으로 로그인 성공 ')));
          await authNotifier.login(token.accessToken); // 로그인 성공 시 토큰 저장
          // ref.read(userProvider.notifier).kakaoLogin(name: "나는카카오유저");
        } catch (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('카카오톡으로 로그인 실패 $error')));
        }
      }
    }

    return Column(
      children: [
        SocialLoginButton(
            iconData: Icons.apple,
            text: "Apple로 계속하기",
            backgroundColor: Colors.black,
            textColor: Colors.white,
            onTap: () =>
                ref.read(userProvider.notifier).appleLogin(name: "나는애플유저")),
        const SizedBox(
          height: 16,
        ),
        SocialLoginButton(
          svgIconPath: "assets/icons/kakao_icon.svg",
          text: "카카오로 시작하기",
          backgroundColor: const Color(0xfffee500),
          textColor: Colors.black,
          onTap: signInWithKakao,
        ),
      ],
    );
  }
}
