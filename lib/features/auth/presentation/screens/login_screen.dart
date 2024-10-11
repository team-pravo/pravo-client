import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravo_client/assets/constants.dart' as constants;
import 'package:pravo_client/features/auth/presentation/widgets/social_login_button_widget.dart';

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

class TextLogo extends StatelessWidget {
  const TextLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Pravo",
              style: GoogleFonts.sen(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: constants.kPrimaryColor),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              "와 함께",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: constants.kPrimaryColor,
              ),
            )
          ],
        ),
        const Text(
          "약속을 지키는 재미를 느껴보세요!",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: constants.kPrimaryColor,
          ),
        )
      ],
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SocialLoginButton(
          iconData: Icons.apple,
          text: "Apple로 계속하기",
          backgroundColor: Colors.black,
          textColor: Colors.white,
        ),
        SizedBox(
          height: 16,
        ),
        SocialLoginButton(
          svgIconPath: "assets/icons/kakao_icon.svg",
          text: "카카오로 시작하기",
          backgroundColor: Color(0xfffee500),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
