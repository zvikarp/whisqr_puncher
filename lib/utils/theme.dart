import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/consts/theme.dart';

class ThemeUtil {
  Map<String, ThemeData> themes = {
    GeneralConsts.DEFAULT_THEME: ThemeData(
      brightness: Brightness.light,
      primaryColor: ThemeConsts.PRIMARY_COLOR,
      accentColor: ThemeConsts.ACCENT_COLOR,
      backgroundColor: ThemeConsts.BACKGROUND_COLOR,
      fontFamily: ThemeConsts.BRAND_FONT,
      disabledColor: ThemeConsts.DARK_TEXT_COLOR.withOpacity(0.3),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 18,
          height: 0.9,
          fontWeight: FontWeight.w400,
          color: ThemeConsts.DARK_TEXT_COLOR.withOpacity(0.6),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ThemeConsts.DARK_TEXT_COLOR,
        selectionHandleColor: ThemeConsts.DARK_TEXT_COLOR,
        selectionColor: ThemeConsts.DARK_TEXT_COLOR.withOpacity(0.5),
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          height: 1.2,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: ThemeConsts.DARK_TEXT_COLOR,
        ),
        headline1: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: ThemeConsts.DARK_TEXT_COLOR,
        ),
        headline2: TextStyle(
          height: 0.9,
          fontSize: 64,
          fontWeight: FontWeight.w400,
          color: ThemeConsts.LIGHT_TEXT_COLOR,
        ),
        headline3: TextStyle(
          height: 0.9,
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: ThemeConsts.DARK_TEXT_COLOR,
        ),
        headline4: TextStyle(
          fontSize: 22,
          height: 0.9,
          fontWeight: FontWeight.w700,
          color: ThemeConsts.DARK_TEXT_COLOR,
        ),
        headline5: TextStyle(
          fontSize: 28,
          height: 0.9,
          fontWeight: FontWeight.w400,
          color: ThemeConsts.DARK_TEXT_COLOR,
        ),
      ),
    ),
  };

  ThemeData? getTheme() => themes[GeneralConsts.DEFAULT_THEME];
}

ThemeUtil themeUtil = ThemeUtil();
