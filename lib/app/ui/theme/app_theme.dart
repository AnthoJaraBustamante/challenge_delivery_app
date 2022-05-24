import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:challenge_delivery_app/app/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorTheme.primary,
    appBarTheme: const AppBarTheme(
      color: ColorTheme.primary,
      centerTitle: true,
    ),
    primarySwatch:
        MaterialColor(ColorTheme.primaryMap[900]!.value, ColorTheme.primaryMap),
    primaryTextTheme: const TextTheme(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorTheme.primary,
      selectionColor: ColorTheme.primary.withOpacity(0.4),
      selectionHandleColor: ColorTheme.primary,
    ),
    textTheme: TextStyleTheme.textTheme,
     brightness: Brightness.light,
    dividerColor: ColorTheme.darkSecondary,
  );
  static final ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: ColorTheme.darkSecondary,
    primaryColor: ColorTheme.darkTertiary,
    appBarTheme: const AppBarTheme(
      color: ColorTheme.darkTertiary,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primarySwatch: MaterialColor(
      ColorTheme.darkPrimaryMap[900]!.value,
      ColorTheme.darkPrimaryMap,
    ),
    primaryTextTheme: TextStyleTheme.darkTextTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorTheme.darkTertiary,
      selectionColor: ColorTheme.darkTertiary.withOpacity(0.4),
      selectionHandleColor: ColorTheme.darkTertiary,
    ),
    textTheme: TextStyleTheme.darkTextTheme,
    primaryIconTheme: const IconThemeData(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.white,
    brightness: Brightness.dark,
    dividerColor: Colors.white,
  );
}
