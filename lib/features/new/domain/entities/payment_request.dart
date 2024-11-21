import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentRequest {
  final String name;
  final String location;
  final int deposit;
  final DateTime scheduledAt;

  PaymentRequest({
    required this.name,
    required this.location,
    required this.deposit,
    required this.scheduledAt,
  });

  PaymentRequest copyWith({
    String? name,
    String? location,
    int? deposit,
    DateTime? scheduledAt,
  }) {
    return PaymentRequest(
      name: name ?? this.name,
      location: location ?? this.location,
      deposit: deposit ?? this.deposit,
      scheduledAt: scheduledAt ?? this.scheduledAt,
    );
  }

  String get formattedDate {
    return DateFormat('MM월 dd일 EEEE', 'ko_KR').format(scheduledAt);
  }

  String formattedTime(BuildContext context) {
    return TimeOfDay(
      hour: scheduledAt.hour,
      minute: scheduledAt.minute,
    ).format(context);
  }

  PaymentRequest updateDate(DateTime newDate) {
    return copyWith(
      scheduledAt: DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        scheduledAt.hour,
        scheduledAt.minute,
      ),
    );
  }

  PaymentRequest updateTime(TimeOfDay newTime) {
    return copyWith(
      scheduledAt: DateTime(
        scheduledAt.year,
        scheduledAt.month,
        scheduledAt.day,
        newTime.hour,
        newTime.minute,
      ),
    );
  }
}
