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
    final date = DateFormat('MM월 d일').format(dateTime);
    final time = DateFormat('h:mm a', 'en_US').format(dateTime);

    return '$date ($weekDay) $time';
  }
}
