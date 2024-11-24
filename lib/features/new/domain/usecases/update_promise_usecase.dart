import 'package:flutter/material.dart';
import 'package:pravo_client/features/new/domain/entities/promise_information.dart';

class UpdatePromiseUseCase {
  PromiseInformation call({
    required PromiseInformation promise, // 이전 상태
    String? name,
    String? location,
    int? deposit,
    DateTime? date,
    TimeOfDay? time,
  }) {
    return promise.copyWith(
      name: name,
      location: location,
      deposit: deposit,
      date: date,
      time: time,
    );
  }
}
