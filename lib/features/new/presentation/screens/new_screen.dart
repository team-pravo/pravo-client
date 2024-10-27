import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/date_provider.dart';
import 'package:pravo_client/features/new/presentation/widgets/date_picker_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';

class NewScreen extends ConsumerWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final isButtonEnabled = selectedDate != null;

    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '약속 생성',
        actionIcon: Icons.notifications_none_rounded,
        actionOnPressed: () {},
      ),
      bottomNavigationBar: const NavigationBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '약속일',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const DatePickerWidget(),
                  const Spacer(
                    flex: 1,
                  ),
                  PrimaryButtonWidget(
                    onTap: () => context.push('/new/details'),
                    buttonColor: kPrimaryColor,
                    textColor: Colors.white,
                    buttonText: '약속 생성하기',
                    icon: Icons.chevron_right_rounded,
                    iconBeforeText: false,
                    isEnabled: isButtonEnabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
