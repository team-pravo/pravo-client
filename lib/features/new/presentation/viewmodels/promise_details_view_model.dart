import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/domain/entities/payment_request.dart';

final promiseDetailsViewModel =
    StateNotifierProvider<PromiseDetailsViewModel, PaymentRequest>(
  (ref) => PromiseDetailsViewModel(),
);

class PromiseDetailsViewModel extends StateNotifier<PaymentRequest> {
  PromiseDetailsViewModel()
      : super(
          PaymentRequest(
            name: '',
            location: '',
            deposit: 0,
            scheduledAt: DateTime.now(),
          ),
        );

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateLocation(String location) {
    state = state.copyWith(location: location);
  }

  void updateDeposit(int deposit) {
    state = state.copyWith(deposit: deposit);
  }

  void updateDate(DateTime newDate) {
    state = state.updateDate(newDate);
  }

  void updateTime(TimeOfDay newTime) {
    state = state.updateTime(newTime);
  }
}
