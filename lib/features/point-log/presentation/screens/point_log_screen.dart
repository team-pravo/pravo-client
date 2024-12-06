import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/log_widget.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_log.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_status.dart';
import 'package:pravo_client/features/point-log/presentation/viewmodels/get_point_log_view_model.dart';

class PointLogScreen extends ConsumerStatefulWidget {
  const PointLogScreen({super.key});

  @override
  ConsumerState<PointLogScreen> createState() => _PointLogScreenState();
}

class _PointLogScreenState extends ConsumerState<PointLogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pointLogViewModel = ref.watch(getPointLogViewModelProvider);

    ref.listen<AsyncValue<List<PointLog>>>(getPointLogViewModelProvider,
        (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          context.go(
            '/error',
            extra: {
              'appBarTitle': '오류',
              'errorTitle': '오류가 발생했습니다.',
              'errorMessage': '포인트 내역을 조회할 수 없습니다.',
            },
          );
        },
      );
    });

    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '포인트 내역',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: pointLogViewModel.when(
          data: (pointLogs) {
            return ListView.separated(
              padding: kScreenPadding,
              itemCount: pointLogs.length,
              separatorBuilder: (BuildContext context, int index) {
                return const DividerWithPaddingWidget(
                  paddingHeight: 24,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                final log = pointLogs[index];
                return LogWidget(
                  title: log.promiseName,
                  amount:
                      '${log.pointStatus == PointStatus.PLUS ? '+' : '-'}${Formatter.formatWithComma(log.pointAmount)}P',
                  type: log.pointStatus.label,
                  loggedAt: Formatter.format(log.pointDate),
                  isAmountPrimaryColor: log.pointStatus == PointStatus.PLUS,
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
