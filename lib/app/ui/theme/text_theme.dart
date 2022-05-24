import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleTheme {
  static TextTheme textTheme = TextTheme(
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    subtitle2: subtitle2,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    caption: caption,
  );

  static TextStyle headline4 = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: ColorTheme.darkSecondary,
    letterSpacing: 0.4,
    height: 0.9,
  );
  static TextStyle headline5 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: ColorTheme.darkSecondary,
    letterSpacing: 0.27,
  );
  static TextStyle headline6 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorTheme.darkSecondary,
    letterSpacing: 0.18,
  );
  static TextStyle subtitle2 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorTheme.darkSecondary,
    letterSpacing: -0.04,
  );
  static TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorTheme.darkSecondary,
    letterSpacing: 0.2,
  );
  static TextStyle bodyText2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
  );
  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorTheme.darkSecondary,
    letterSpacing: 0.2,
  );
  static TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    color: ColorTheme.darkSecondary,
    letterSpacing: 0.27,
  );
  static TextTheme darkTextTheme = TextTheme(
    headline2: headline2.copyWith(color: Colors.white),
    headline4: headline4.copyWith(color: Colors.white),
    headline5: headline5.copyWith(color: Colors.white),
    headline6: headline6.copyWith(color: Colors.white),
    subtitle2: subtitle2.copyWith(color: Colors.white),
    bodyText1: bodyText1.copyWith(color: Colors.white),
    bodyText2: bodyText2.copyWith(color: Colors.white),
    caption: caption.copyWith(color: Colors.white),
  );
}
