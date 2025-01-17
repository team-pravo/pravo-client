import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_view_model.dart';
import 'package:pravo_client/features/new/presentation/widgets/input_field_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/time_picker_widget.dart';

class PromiseDetailsInputFieldsWidget extends ConsumerWidget {
  const PromiseDetailsInputFieldsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promiseDetailsNotifier =
        ref.watch(promiseDetailsViewModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '약속 시간',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TimePickerWidget(),
        const SizedBox(
          height: 32,
        ),
        const Text(
          '약속명',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InputFieldWidget(
          placeholder: '약속명을 입력해주세요.',
          inputType: TextInputType.text,
          onChanged: (value) =>
              promiseDetailsNotifier.updatePromise(newName: value),
        ),
        const SizedBox(
          height: 32,
        ),
        const Text(
          '약속 장소',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InputFieldWidget(
          placeholder: '약속 장소를 입력해주세요.',
          inputType: TextInputType.text,
          onChanged: (value) =>
              promiseDetailsNotifier.updatePromise(newLocation: value),
        ),
        const SizedBox(
          height: 32,
        ),
        const Text(
          '예약금',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InputFieldWidget(
          placeholder: '1인당 사전에 예약할 금액을 입력해주세요.',
          inputType: TextInputType.number,
          onChanged: (value) {
            final cleanedValue = value.replaceAll(',', ''); // 쉼표 제거
            final deposit = int.tryParse(cleanedValue) ?? 0; // 정수로 변환
            promiseDetailsNotifier.updatePromise(newDeposit: deposit);
          },
        ),
      ],
    );
  }
}
