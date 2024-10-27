import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

final ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: kAppBarFontSize,
      fontWeight: kAppBarFontWeight,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      size: kAppBarIconSize,
      color: Colors.black,
    ),
    backgroundColor: kBackgroundColor,
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kBackgroundColor,
  ),
  colorScheme: const ColorScheme.light(primary: kPrimaryColor),
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: kBackgroundColor,
    dividerColor: kPrimaryColor,
    headerBackgroundColor: kBackgroundColor,
  ),
  timePickerTheme: const TimePickerThemeData(
    dayPeriodColor: kPrimaryColor,
  ),
);
