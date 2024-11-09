import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/confirm_attendance_button_widget.dart';

class ConfirmAttendanceScreen extends StatelessWidget {
  final int promiseId;

  const ConfirmAttendanceScreen({super.key, required this.promiseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '참석 확인',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: kScreenPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '참여자',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true, // <==== limit height. 리스트뷰 크기 고정
                            primary: false,
                            itemCount: 10,
                            itemBuilder: (_, __) =>
                                const ConfirmAttendanceButtonWidget(),
                            separatorBuilder: (_, __) =>
                                const VerticalGapWidget(
                              gapHeight: 12,
                            ),
                          ),
                        ],
                      ),
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
