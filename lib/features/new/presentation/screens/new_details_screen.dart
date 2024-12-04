import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/go_to_desposit_screen_button_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/promise_details_input_fields_widget.dart';

class NewDetailsScreen extends StatelessWidget {
  const NewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '약속 생성',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () => context.pop(),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: kScreenPadding,
                  child: PromiseDetailsInputFieldsWidget(),
                ),
              ),
            ),
            GoToDepositScreenButtonWidget(),
          ],
        ),
      ),
    );
  }
}
