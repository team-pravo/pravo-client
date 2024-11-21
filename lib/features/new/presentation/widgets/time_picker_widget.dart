import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/dialog_button_widget.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_view_model.dart';
import 'package:pravo_client/features/new/presentation/widgets/picker_widget.dart';
import 'package:wheel_picker/wheel_picker.dart';

class TimePickerWidget extends ConsumerWidget {
  TimePickerWidget({super.key});

  final now = TimeOfDay.now();

  /// 12시간제를 기준으로 시간 선택
  late final _hoursWheel = WheelPickerController(
    itemCount: 12,
    initialIndex: now.hour % 12,
  );

  /// 분 선택
  late final _minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
    mounts: [_hoursWheel],
  );

  /// AM/PM 선택
  late final _amPmWheel = WheelPickerController(
    itemCount: 2,
    initialIndex: (now.period == DayPeriod.am) ? 0 : 1,
  );

  // 다이얼로그에서 시간 선택하는 메서드
  Future<void> _selectTime(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 200,
            width: 300,
            child: _buildTimePicker(context),
          ),
          actions: _buildDialogActions(context, ref),
          contentPadding: const EdgeInsets.fromLTRB(
            24,
            24,
            24,
            0,
          ),
        );
      },
    );
  }

  // TimePicker UI 빌드 메서드
  Widget _buildTimePicker(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _centerBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  ..._buildTimeWheels(),
                  const SizedBox(width: 6.0),
                  _buildAmPmWheel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 시간 선택을 위한 WheelPicker 목록 생성
  List<Widget> _buildTimeWheels() {
    const textStyle = TextStyle(
      fontSize: 26.0,
      height: 1.5,
    );
    final wheelStyle = _buildWheelPickerStyle(textStyle);

    Widget hourItemBuilder(BuildContext context, int index) {
      // 0을 12로 표시
      final displayHour = index == 0 ? 12 : index;
      return Text('$displayHour', style: textStyle);
    }

    Widget minuteItemBuilder(BuildContext context, int index) {
      return Text('$index'.padLeft(2, '0'), style: textStyle);
    }

    return [
      Expanded(
        child: WheelPicker(
          builder: hourItemBuilder,
          controller: _hoursWheel,
          style: wheelStyle,
          selectedIndexColor: kPrimaryColor,
        ),
      ),
      const Text(
        ':',
        style: TextStyle(fontSize: 26.0, height: 1.5),
      ),
      Expanded(
        child: WheelPicker(
          builder: minuteItemBuilder,
          controller: _minutesWheel,
          looping: true, // minute는 반복되도록 설정
          style: wheelStyle,
          selectedIndexColor: kPrimaryColor,
        ),
      ),
    ];
  }

  // AM/PM 선택을 위한 WheelPicker 생성
  Widget _buildAmPmWheel() {
    const textStyle = TextStyle(fontSize: 26.0, height: 1.5);
    final wheelStyle = _buildWheelPickerStyle(textStyle).copyWith(
      shiftAnimationStyle: const WheelShiftAnimationStyle(
        duration: Duration(seconds: 1),
        curve: Curves.bounceOut,
      ),
    );

    return Expanded(
      child: WheelPicker(
        builder: (context, index) =>
            Text(['AM', 'PM'][index], style: textStyle),
        controller: _amPmWheel,
        looping: false,
        style: wheelStyle,
      ),
    );
  }

  // WheelPicker 스타일 생성
  WheelPickerStyle _buildWheelPickerStyle(TextStyle textStyle) {
    return WheelPickerStyle(
      itemExtent: textStyle.fontSize! * textStyle.height!,
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );
  }

  // 다이얼로그의 액션 버튼 생성
  List<Widget> _buildDialogActions(BuildContext context, WidgetRef ref) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DialogButtonWidget(
            buttonText: '취소',
            onTap: () => Navigator.of(context).pop(),
            buttonColor: kWidgetBackgroundColor,
            textColor: Colors.black,
          ),
          const SizedBox(
            width: 8,
          ),
          DialogButtonWidget(
            buttonText: '확인',
            onTap: () {
              // 선택한 시간과 분 가져오기
              final selectedHour =
                  _hoursWheel.selected == 0 ? 12 : _hoursWheel.selected;
              final selectedMinute = _minutesWheel.selected;
              final isAm = _amPmWheel.selected == 0;

              // AM/PM에 따라 시간을 조정
              final adjustedHour =
                  isAm ? selectedHour % 12 : (selectedHour % 12) + 12;

              // TimeOfDay 객체 생성
              final selectedTime = TimeOfDay(
                hour: adjustedHour,
                minute: selectedMinute,
              );

              ref
                  .read(promiseDetailsViewModelProvider.notifier)
                  .updatePromise(newTime: selectedTime);

              Navigator.of(context).pop();
            },
            buttonColor: kPrimaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promiseDetails = ref.watch(promiseDetailsViewModelProvider);
    final formattedTime = promiseDetails.formattedTime(context);

    return PickerWidget(
      selectedValue: formattedTime,
      onTap: () => _selectTime(context, ref),
    );
  }

  // 중앙 강조 바 생성
  Widget _centerBar() {
    return Center(
      child: Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: kWidgetBackgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
