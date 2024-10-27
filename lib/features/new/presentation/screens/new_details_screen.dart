import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/input_field_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/new/presentation/widgets/time_picker_widget.dart';

class NewDetailsScreen extends StatelessWidget {
  const NewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '약속 생성',
        leadingIcon: Icons.chevron_left_rounded,
        leadingOnPressed: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
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
                  const InputFieldWidget(
                    placeholder: '약속명을 입력해주세요.',
                    inputType: TextInputType.text,
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
                  const InputFieldWidget(
                    placeholder: '약속 장소를 입력해주세요.',
                    inputType: TextInputType.text,
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
                  const InputFieldWidget(
                    placeholder: '1인당 사전에 예약할 금액을 입력해주세요.',
                    inputType: TextInputType.number,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  PrimaryButtonWidget(
                    onTap: () {
                      context.push('/new/deposit');
                    },
                    buttonText: '예약금 결제하기',
                    buttonColor: kPrimaryColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
