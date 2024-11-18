import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/domain/entities/promise_details.dart';

final promiseDetailsProvider =
    StateNotifierProvider.autoDispose<PromiseDetailsNotifier, PromiseDetails>(
  (ref) => PromiseDetailsNotifier(ref),
);

class PromiseDetailsNotifier extends StateNotifier<PromiseDetails> {
  PromiseDetailsNotifier(Ref ref)
      : super(
          PromiseDetails(
            name: '',
            location: '',
            deposit: 0,
            dateTime: null,
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
