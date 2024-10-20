import 'package:flutter/material.dart';
import 'package:pravo_client/features/auth/presentation/widgets/social_login_buttons_widget.dart';
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
          TextLogoWidget(),
          SizedBox(height: 200),
          SocialLoginButtons(),
        ],
      ),
    );
  }
}
