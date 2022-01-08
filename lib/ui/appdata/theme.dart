import 'package:flutter/material.dart';

class CustomTheme {
  static const primaryColor = Color(0xFF7C56EF);
  static const backgroundColor = Color(0xFFFFFCFF);
  static const buttonColor = Color(0xFFF7F5FA);
  static const textColor = Color(0xFF7E8AAD);

  static final mainTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: textColor,
      ),
      button: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w300,
        color: textColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      centerTitle: true,
      color: backgroundColor,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );
}
