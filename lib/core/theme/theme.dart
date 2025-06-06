import 'package:flutter/material.dart';

abstract class AppTheming {
  static ThemeData ligtMode = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      surface: Colors.white, //background color
      primary: Color(0xffffc529),
      secondary: Color(0xff272d2f),
      tertiary: Color(0xfffe724c), //color for big sub title
      shadow: Color.fromARGB(255, 184, 179, 179), // color for smal sub title
    ),
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Color(0xFF191925), //background color
      primary: Color.fromARGB(255, 48, 72, 189),
      secondary: Colors.white,
      tertiary: Color(0xffc31331), //color for big sub title
      shadow: Color(0xffcbb2ab),
      onPrimary: Colors.white,
      onSecondary: Color(0xfff79e1B),
      onTertiary: Colors.amber,
      // color for smal sub title
    ),
  );
}
