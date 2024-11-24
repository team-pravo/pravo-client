import 'package:flutter/material.dart';
import 'package:pravo_client/features/new/domain/entities/payment_request.dart';

class PromiseInformation {
  final String? name;
  final String? location;
  final int? deposit;
  final DateTime? date;
  final TimeOfDay? time;

  PromiseInformation({
    this.name,
    this.location,
    this.deposit,
    this.date,
    this.time,
  });

  PromiseInformation copyWith({
    String? name,
    String? location,
    int? deposit,
    DateTime? date,
    TimeOfDay? time,
  }) {
    return PromiseInformation(
      name: name ?? this.name,
      location: location ?? this.location,
      deposit: deposit ?? this.deposit,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  /// 시간을 hh:mm 형식으로 반환
  String formattedTime(BuildContext context) {
    return time?.format(context) ?? '시간을 선택하세요';
  }

  /// 날짜와 시간을 결합하여 현재보다 이후인지 확인하는 메소드
  bool isAfterNow() {
    if (date == null || time == null) {
      return false;
    }

    // 날짜와 시간을 결합하여 DateTime 객체 생성
    final combinedDateTime = DateTime(
      date!.year,
      date!.month,
      date!.day,
      time!.hour,
      time!.minute,
    );

    // 현재 시간과 비교
    return combinedDateTime.isAfter(DateTime.now());
  }

  /// PromiseInformation을 PaymentRequest로 변환하는 메소드
  PaymentRequest toPaymentRequest() {
    if (name == null ||
        location == null ||
        deposit == null ||
        date == null ||
        time == null) {
      throw Exception('필수 필드가 누락되었습니다.');
    }

    final scheduledAt = DateTime(
      date!.year,
      date!.month,
      date!.day,
      time!.hour,
      time!.minute,
    );

    return PaymentRequest(
      name: name!,
      location: location!,
      deposit: deposit!,
      scheduledAt: scheduledAt,
    );
  }
}
