import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/payment-log/domain/entities/payment_log.dart';
import 'package:pravo_client/features/payment-log/domain/entities/payment_status.dart';
import 'package:pravo_client/features/payment-log/presentation/viewmodels/get_payment_log_view_model.dart';
import 'package:pravo_client/features/core/presentation/widgets/log_widget.dart';

class PaymentLogScreen extends ConsumerStatefulWidget {
  const PaymentLogScreen({super.key});

  @override
  ConsumerState<PaymentLogScreen> createState() => _PaymentLogScreenState();
}

class _PaymentLogScreenState extends ConsumerState<PaymentLogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<List<PaymentLog>>>(
      getPaymentLogViewModelProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            context.go(
              '/error',
              extra: {
                'appBarTitle': '오류',
                'errorTitle': '오류가 발생했습니다.',
                'errorMessage': '결제 내역을 조회할 수 없습니다.',
              },
            );
          },
        );
      },
    );

    final paymentLogViewModel = ref.watch(getPaymentLogViewModelProvider);

    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '결제 내역',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: paymentLogViewModel.when(
          data: (paymentLogs) {
            return ListView.separated(
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
                  amount: '${Formatter.formatWithComma(log.paymentAmount)}원',
                  type: log.paymentStatus.label,
                  loggedAt: Formatter.format(log.paymentDate),
                  isAmountPrimaryColor:
                      log.paymentStatus == PaymentStatus.COMPLETED,
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
