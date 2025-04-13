import 'package:flutter/material.dart';

class AppTheme {
  // Define primary and secondary colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.orange;
  static const Color backgroundColor = Colors.white;
  static const Color appBarColor = Colors.blueAccent;
  static const Color textColor = Colors.black;
  static const Color buttonColor = Colors.blue;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: appBarColor,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
       ),
    buttonTheme: const ButtonThemeData(
      buttonColor: buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(),
    buttonTheme: const ButtonThemeData(
      buttonColor: secondaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
    ),
  );
}
