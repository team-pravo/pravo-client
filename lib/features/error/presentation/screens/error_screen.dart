import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';

class ErrorScreen extends StatelessWidget {
  final String appBarTitle;
  final String errorTitle;
  final String errorMessage;

  const ErrorScreen({
    super.key,
    required this.appBarTitle,
    required this.errorTitle,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(title: appBarTitle),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    PhosphorIcon(
                      PhosphorIcons.warningCircle(
                        PhosphorIconsStyle.regular,
                      ),
                      size: 70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      errorTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kBodyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '홈으로 돌아가기',
              onTap: () => context.go('/'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
