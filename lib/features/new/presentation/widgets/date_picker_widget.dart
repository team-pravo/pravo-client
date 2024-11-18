import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate =
        ref.watch(promiseDetailsProvider).dateTime ?? DateTime.now();

    return CalendarDatePicker(
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      onDateChanged: (pickedDate) {
        ref.read(promiseDetailsProvider.notifier).updateDate(pickedDate);
      },
    );
  }
}
