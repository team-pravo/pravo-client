import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/settlement/presentation/widgets/attendance_list_widget.dart';

class ConfirmAttendanceScreen extends ConsumerWidget {
  final int promiseId;

  const ConfirmAttendanceScreen({super.key, required this.promiseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '참석 확인',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: kScreenPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '참여자',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      AttendanceListWidget(),
                    ],
                  ),
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '정산하러 가기',
              onTap: () =>
                  context.push('/promise/$promiseId/settlement/complete'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
