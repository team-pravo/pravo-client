import 'package:flutter/material.dart';

// AppBar
const double kAppBarHeight = 50;
const double kAppBarFontSize = 16;
const FontWeight kAppBarFontWeight = FontWeight.w500;
const double kAppBarIconSize = 24;

// Colors
const Color kPrimaryColor = Color(0xFF74A739);
const Color kSecondaryColor = Color.fromRGBO(159, 79, 21, 1);
const Color kBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color kWidgetBackgroundColor = Color.fromRGBO(246, 246, 246, 1);
const Color kBorderColor = Color.fromARGB(255, 219, 219, 219);
const Color kDividerColor = Color.fromARGB(255, 244, 244, 244);
const Color kPlaceholderColor = Color.fromRGBO(60, 60, 67, 0.3);
const Color kBodyTextColor = Color.fromARGB(255, 110, 110, 115);

// IconColor
const Color kSelectedIconColor = Color.fromRGBO(116, 167, 57, 1);
const Color kUnselectedIconColor = Color.fromRGBO(201, 201, 201, 1);

// AvatarColor
const Color kAvatarBackgroundColor = Color.fromRGBO(240, 240, 240, 1);

// Padding values
const double kHorizontalPadding = 24;
const double kVerticalPadding = 30;

// Layout
const EdgeInsets kScreenPadding = EdgeInsets.fromLTRB(
  kHorizontalPadding,
  kVerticalPadding,
  kHorizontalPadding,
  kVerticalPadding,
);

// Input Style
const double kInputTextFontSize = 16.0;
final kInputFieldDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: kBorderColor,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: kPrimaryColor,
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: kBorderColor,
      width: 1,
    ),
  ),
  hintStyle: const TextStyle(
    color: kPlaceholderColor,
    fontSize: kInputTextFontSize,
  ),
);

// Widget Style
const kWidgetPadding = EdgeInsets.symmetric(
  vertical: 15,
  horizontal: 20,
);
final kWidgetBorderRadius = BorderRadius.circular(15);
