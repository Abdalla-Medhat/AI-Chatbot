import 'package:flutter/material.dart';

class Appfonts {
  const Appfonts._();
  static const String inter = "Inter";
}

class AppTextStyles {
  const AppTextStyles._();
  static const TextTheme textTheme = TextTheme(
    // display-md
    displayMedium: TextStyle(
      fontFamily: Appfonts.inter,
      fontSize: 44.0,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),

    // title-lg
    titleLarge: TextStyle(
      fontFamily: Appfonts.inter,
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    // body-lg
    bodyLarge: TextStyle(
      fontFamily: Appfonts.inter,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      height: 1.6,
    ),

    // label-md
    labelMedium: TextStyle(
      fontFamily: Appfonts.inter,
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
  );
}
