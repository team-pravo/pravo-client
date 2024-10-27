import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/new/presentation/widgets/primary_button_widget.dart';

class GoToDepositScreenButtonWidget extends StatelessWidget {
  const GoToDepositScreenButtonWidget({
    super.key,
    required this.isButtonEnabled,
  });

  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      isEnabled: isButtonEnabled,
      onTap: () => context.push('/new/deposit'),
      buttonText: '예약금 결제하기',
      buttonColor: kPrimaryColor,
      textColor: Colors.white,
    );
  }
}
