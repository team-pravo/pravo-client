import 'package:intl/intl.dart';

class Formatter {
  static final weekDayNames = ['일', '월', '화', '수', '목', '금', '토'];

  Formatter._();

  static String formatWithComma(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

  static String format(DateTime dateTime) {
    final weekDay = weekDayNames[dateTime.weekday % 7];
    final date = DateFormat('M월 d일').format(dateTime);
    final time = DateFormat('a h:mm', 'ko_KR').format(dateTime);

    return '$date ($weekDay) $time';
  }

  static String formatWeekDay(DateTime dateTime) {
    final weekDay = weekDayNames[dateTime.weekday % 7];
    return '$weekDay요일';
  }
}
