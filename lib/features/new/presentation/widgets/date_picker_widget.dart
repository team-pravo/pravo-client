import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/date_provider.dart';

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CalendarDatePicker(
      initialDate: ref.watch(dateProvider),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      onDateChanged: (pickedDate) {
        ref.read(dateProvider.notifier).updateDate(pickedDate);
      },
    );
  }
}
