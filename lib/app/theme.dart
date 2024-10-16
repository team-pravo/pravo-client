import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart' as constants;

final ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: constants.kAppBarFontSize,
      fontWeight: constants.kAppBarFontWeight,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      size: constants.kAppBarIconSize,
      color: Colors.black,
    ),
    backgroundColor: constants.kBackgroundColor,
  ),
  scaffoldBackgroundColor: constants.kBackgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: constants.kBackgroundColor,
  ),
);
