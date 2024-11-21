import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/domain/entities/promise_information.dart';
import 'package:pravo_client/features/new/domain/usecases/update_promise_usecase.dart';

final promiseDetailsViewModelProvider =
    StateNotifierProvider<PromiseDetailsViewModel, PromiseInformation>((ref) {
  final initialPromise = PromiseInformation(
    name: null,
    location: null,
    deposit: null,
    date: null,
    time: const TimeOfDay(hour: 9, minute: 0),
  );
  return PromiseDetailsViewModel(initialPromise: initialPromise);
});

class PromiseDetailsViewModel extends StateNotifier<PromiseInformation> {
  final UpdatePromiseUseCase updatePromiseUseCase;

  PromiseDetailsViewModel({required PromiseInformation initialPromise})
      : updatePromiseUseCase = UpdatePromiseUseCase(),
        super(initialPromise);

  void updatePromise({
    String? newName,
    String? newLocation,
    int? newDeposit,
    DateTime? newDate,
    TimeOfDay? newTime,
  }) {
    state = updatePromiseUseCase(
      promise: state,
      name: newName,
      location: newLocation,
      deposit: newDeposit,
      date: newDate,
      time: newTime,
    );
  }
}
