import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider =
    StateNotifierProvider.autoDispose<TimeNotifier, TimeOfDay?>(
  (ref) => TimeNotifier(),
);

class TimeNotifier extends StateNotifier<TimeOfDay?> {
  TimeNotifier() : super(null);

  /// 시간 업데이트
  void updateTime(TimeOfDay newTime) {
    state = newTime;
  }

  /// 시간을 hh:mm 형식으로 반환
  String formattedTime(BuildContext context) {
    return state?.format(context) ?? '시간을 선택하세요';
  }
}
