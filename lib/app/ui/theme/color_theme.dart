import 'package:flutter/material.dart';

class ColorTheme {
  static const Color primaryTint = Color(0xFFb99af6);
  static const Color primaryAccent = Color(0xFF593d94);
  static const Color primary = Color(0xFF321474);

  static const Color darkPrimary = Color.fromRGBO(247, 108, 2, 1);
  static const Color darkSecondary = Color(0xFF211c2b);
  static const Color darkTertiary = Color(0xFFFEA51B);
  static const Color darkQuaternary = Color(0xFFe2aa52);
  static const Color darkQuinary = Color(0xFFea6f54);
  static const Color darkSenary = Color.fromRGBO(85, 80, 61, 1);
  static const Color darkSeptenary = Color(0xFFf4f4f4);
  static const Color darkOctonary = Color.fromRGBO(95, 136, 118, 1);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      primaryTint,
      primary,
    ],
    // stops: <double>[0.6, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.mirror,
  );
  static LinearGradient primaryDarkGradient = const LinearGradient(
    colors: [
      darkTertiary,
      darkPrimary,
    ],
    stops: <double>[0.7, 0.95],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.mirror,
  );
  static LinearGradient primaryDarkGradientShader = const LinearGradient(
    colors: [darkQuaternary, darkQuaternary],
    stops: <double>[0.7, 0.95],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.mirror,
  );
  static const LinearGradient splashGradient = LinearGradient(
    colors: [
      Color(0xFFFF9718),
      Color(0xffffd7a7),
    ],
    stops: <double>[0.3, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.mirror,
  );
  static Shader primaryShaderGradient =
      primaryGradient.createShader(const Rect.fromLTWH(0.0, 2.0, 1.0, 0.0));

  static Shader primaryDarkShaderGradient =
      primaryDarkGradientShader.createShader(const Rect.fromLTWH(0.0, 2.0, 1.0, 0.0));

  static Map<int, Color> darkPrimaryMap = {
    50: ColorTheme.darkPrimary.withOpacity(0.05),
    100: ColorTheme.darkPrimary.withOpacity(0.1),
    200: ColorTheme.darkPrimary.withOpacity(0.2),
    300: ColorTheme.darkPrimary.withOpacity(0.3),
    400: ColorTheme.darkPrimary.withOpacity(0.4),
    500: ColorTheme.darkPrimary,
    600: ColorTheme.darkPrimary.withOpacity(0.6),
    700: ColorTheme.darkPrimary.withOpacity(0.7),
    800: ColorTheme.darkPrimary.withOpacity(0.8),
    900: ColorTheme.darkPrimary.withOpacity(0.9),
  };
  static Map<int, Color> primaryMap = {
    50: ColorTheme.primary.withOpacity(0.05),
    100: ColorTheme.primary.withOpacity(0.1),
    200: ColorTheme.primary.withOpacity(0.2),
    300: ColorTheme.primary.withOpacity(0.3),
    400: ColorTheme.primary.withOpacity(0.4),
    500: ColorTheme.primary,
    600: ColorTheme.primary.withOpacity(0.6),
    700: ColorTheme.primary.withOpacity(0.7),
    800: ColorTheme.primary.withOpacity(0.8),
    900: ColorTheme.primary.withOpacity(0.9),
  };
}
