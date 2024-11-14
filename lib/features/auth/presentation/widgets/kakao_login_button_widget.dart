import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/oauth_provider.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/auth/presentation/widgets/social_login_button_widget.dart';

class KakaoLoginButtonWidget extends ConsumerWidget {
  const KakaoLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oauthNotifier = ref.read(oauthProvider);
    final authNotifier = ref.read(authProvider);

    // 로그인 성공 처리 함수
    Future<void> handleLoginSuccess(
      OAuthToken token,
      String successMessage,
    ) async {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(successMessage)),
      );
      await oauthNotifier.login(token.accessToken, Platform.kakao);
      await authNotifier.login(token.accessToken, Platform.kakao);
    }

    // 로그인 오류 처리 함수
    void handleLoginError(
      dynamic error,
      String loginMethod,
    ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$loginMethod으로 로그인 실패: $error')),
      );

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') return;
    }

    // 카카오톡 어플로 로그인
    Future<void> signInWithKakaoTalk() async {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        handleLoginSuccess(token, '카카오톡으로 로그인 성공');
      } catch (error) {
        handleLoginError(error, '카카오톡');
      }
    }

    // 카카오 계정으로 로그인
    Future<void> signInWithKakaoAccount() async {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await handleLoginSuccess(token, '카카오계정으로 로그인 성공');
      } catch (error) {
        handleLoginError(error, '카카오계정');
      }
    }

    // 카카오톡 또는 카카오 계정 로그인
    Future<void> signInWithKakao() async {
      if (await isKakaoTalkInstalled()) {
        // 카카오톡 실행이 가능하면 카카오톡으로 로그인
        await signInWithKakaoTalk();
      } else {
        // 카카오 계정으로 로그인
        await signInWithKakaoAccount();
      }
    }

    return SocialLoginButtonWidget(
      svgIconPath: 'assets/icons/kakao_icon.svg',
      text: '카카오로 시작하기',
      backgroundColor: const Color(0xfffee500),
      textColor: Colors.black,
      onTap: signInWithKakao,
    );
  }
}
