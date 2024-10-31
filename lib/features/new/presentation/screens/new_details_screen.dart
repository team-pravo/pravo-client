import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/time_provider.dart';
import 'package:pravo_client/features/new/presentation/widgets/go_to_desposit_screen_button_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/promise_details_input_fields_widget.dart';

class NewDetailsScreen extends ConsumerWidget {
  const NewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promiseDetails = ref.watch(promiseDetailsProvider);
    final selectedTime = ref.watch(timeProvider);

    final isButtonEnabled = promiseDetails.name.isNotEmpty &&
        promiseDetails.location.isNotEmpty &&
        promiseDetails.deposit > 0 &&
        selectedTime != null;

    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '약속 생성',
        leadingIcon: Icons.chevron_left_rounded,
        leadingOnPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PromiseDetailsInputFieldsWidget(),
                    const Spacer(
                      flex: 1,
                    ),
                    GoToDepositScreenButtonWidget(
                      isButtonEnabled: isButtonEnabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
