import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/setting/domain/entities/payment_log.dart';
import 'package:pravo_client/features/setting/domain/entities/payment_status.dart';
import 'package:pravo_client/features/setting/presentation/widgets/log_widget.dart';

class PaymentLogScreen extends ConsumerStatefulWidget {
  const PaymentLogScreen({super.key});

  @override
  ConsumerState<PaymentLogScreen> createState() => _PaymentLogScreenState();
}

class _PaymentLogScreenState extends ConsumerState<PaymentLogScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    final paymentLogs = [
      PaymentLog(
        promiseName: '망고 빙수 맛집 투어',
        promiseAmount: 10000,
        paymentStatus: PaymentStatus.COMPLETED,
        paymentDate: DateTime.now(),
        updatedDate: DateTime.now(),
      ),
      PaymentLog(
        promiseName: '망고 빙수 맛집 투어',
        promiseAmount: 10000,
        paymentStatus: PaymentStatus.CANCELED,
        paymentDate: DateTime.now(),
        updatedDate: DateTime.now(),
      ),
      PaymentLog(
        promiseName: '망고 빙수 맛집 투어',
        promiseAmount: 10000,
        paymentStatus: PaymentStatus.COMPLETED,
        paymentDate: DateTime.now(),
        updatedDate: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '결제 내역',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: kScreenPadding,
          itemCount: paymentLogs.length,
          separatorBuilder: (BuildContext context, int index) {
            return const DividerWithPaddingWidget(
              paddingHeight: 24,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            final log = paymentLogs[index];
            return LogWidget(
              title: log.promiseName,
              amount: '${Formatter.formatWithComma(log.promiseAmount)}원',
              type: log.paymentStatus.label,
              loggedAt: Formatter.format(log.paymentDate),
              isAmountPrimaryColor:
                  log.paymentStatus == PaymentStatus.COMPLETED,
            );
          },
        ),
      ),
    );
  }
}
