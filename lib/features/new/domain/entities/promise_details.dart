import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PromiseDetails {
  final String name;
  final String location;
  final int deposit;
  final DateTime? dateTime;

  PromiseDetails({
    required this.name,
    required this.location,
    required this.deposit,
    this.dateTime,
  });

  PromiseDetails copyWith({
    String? name,
    String? location,
    int? deposit,
    DateTime? dateTime,
  }) {
    return PromiseDetails(
      name: name ?? this.name,
      location: location ?? this.location,
      deposit: deposit ?? this.deposit,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  String get formattedDate {
    if (dateTime == null) return '날짜를 선택하세요';
    return DateFormat('MM월 dd일 EEEE', 'ko_KR').format(dateTime!);
  }

  String formattedTime(BuildContext context) {
    if (dateTime == null) return '시간을 선택하세요';
    return TimeOfDay(
      hour: dateTime!.hour,
      minute: dateTime!.minute,
    ).format(context);
  }

  PromiseDetails updateDate(DateTime newDate) {
    return copyWith(
      dateTime: DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        dateTime?.hour ?? 0,
        dateTime?.minute ?? 0,
      ),
    );
  }

  PromiseDetails updateTime(TimeOfDay newTime) {
    return copyWith(
      dateTime: DateTime(
        dateTime?.year ?? DateTime.now().year,
        dateTime?.month ?? DateTime.now().month,
        dateTime?.day ?? DateTime.now().day,
        newTime.hour,
        newTime.minute,
      ),
    );
  }
}
