import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/date_provider.dart';
import 'package:pravo_client/features/new/presentation/widgets/picker_widget.dart';

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({super.key});

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    DateTime? selectedDate = ref.read(dateProvider);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      helpText: '날짜 선택',
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).updateDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final formattedDate = selectedDate != null
        ? ref.read(dateProvider.notifier).formattedDate
        : '약속일을 선택하세요';

    return PickerWidget(
      selectedValue: formattedDate,
      onTap: () => _selectDate(context, ref),
    );
  }
}
