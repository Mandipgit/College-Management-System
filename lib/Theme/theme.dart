import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

ThemeData lightmode=ThemeData(
brightness: Brightness.light,
colorScheme: ColorScheme.light(
surface: greyColor,
primary: blueColor,
secondary:  secBlueColor,
),
);
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: backgroundgrey,
    primary: primarygrey,
    secondary: secgrey,
  ),
);