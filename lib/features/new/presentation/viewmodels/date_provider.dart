import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final dateProvider =
    StateNotifierProvider<DateNotifier, DateTime?>((ref) => DateNotifier());

class DateNotifier extends StateNotifier<DateTime?> {
  DateNotifier() : super(null);

  /// 날짜 업데이트
  void updateDate(DateTime? newDate) {
    state = newDate;
  }

  /// 선택된 날짜를 문자열로 반환
  String get formattedDate {
    return DateFormat('MM월 dd일 EEEE', 'ko_KR').format(state!);
  }
}
