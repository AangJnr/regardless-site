import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(BuildContext context) {
  final textStyle = GoogleFonts.poppins();
  final textTheme = GoogleFonts.montserratTextTheme()
      .apply(bodyColor: AppColors.blackColor)
      .copyWith(
        titleLarge: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: textStyle.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
        displayMedium: textStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor,
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor,
        ),
        bodyLarge: GoogleFonts.montserrat(
            fontSize: 20,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            height: 1.3,
            letterSpacing: 0),
        bodyMedium: textStyle.copyWith(
            fontSize: 15, color: AppColors.textColor, letterSpacing: 1.2),
        bodySmall: textStyle.copyWith(
          fontSize: 13,
          color: AppColors.textColor,
        ),
      );
  final theme = Theme.of(context);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: AppColors.primaryColor,
    ),
    canvasColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,
    focusColor: AppColors.accentColor,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
  );
}

class FlutterFlowTheme {
  static TextTheme of(BuildContext context) {
    return Theme.of(context).primaryTextTheme;
  }
}

class Spacing {
  static const spacingNormal = 16.0;
  static const spacingHalf = 8.0;
  static const spacingQuarter = 4.0;
  static const paddingNormal = 16.0;
  static const paddingHalf = 8.0;
  static const paddingQuarter = 4.0;
}

class AppColors {
  // static const accentColor = Color.fromARGB(255, 178, 244, 56);
  // static const accentColorAlt = Color.fromARGB(255, 74, 245, 97);
  //   static const accentColorAlt2 = Color.fromARGB(255, 207, 155, 24);
  static final accentColorText =
      Color.fromARGB(255, 111, 243, 71).withGreen(210);
  static const accentColor = Color.fromARGB(255, 125, 243, 71);
  static const accentColorAlt = Color(0xffbdc3c7);
  static const accentColorAlt2 = Color(0xff4B5258);
  static const primaryColor = Color(0xFF151515);
  static const barrierColor = Color.fromARGB(222, 255, 255, 255);

  static const blackColor = Color.fromARGB(255, 12, 12, 12);
  static const blackColorInverted = Color.fromARGB(255, 42, 42, 42);

  static const canvasColor = Color.fromARGB(255, 244, 244, 244);
  static const canvasColorAlt = Color.fromARGB(255, 213, 219, 224);

  static const adBackgroundColor = Color(0xFFF1F2F2);
  static const primaryButtonColor = blackColor;
  static const darkBlueColor = Color(0xFF042433);
  static const darkBlueColor600 = Color(0xFF094E6F);
  static const darkBlueColor900 = Color(0xFF042433);
  static const green600 = Color(0xff96BD7D);
  static const green700 = Color(0xff759461);
  static const green50 = Color(0xffF6FAF3);
  static const red700 = Color(0xFFE45656);
  static const red50 = Color(0xFFFCEEEE);
  static const calmingBlueColor = Color(0xFF3172AC);
  static const goldColor = Color(0xFFF19F0B);
  static const goldColorDark = Color(0xFFD77602);

  static const dustyOrangeColor = Color(0xFFFDEDD8); //#094E6F
  static const darkPurpleColor50 = Color(0xFFF4F5F8);

  static const calmingBlueColor900 = Color(0xFF516169);
  static const calmingBlueColor600 = calmingBlueColor;
  static const calmingBlueColor100 = Color(0xFFEBF7FD);
  static const calmingBlueColor50 = Color(0xFFC0E6F9);

  static const greyToneColor600 = Color.fromARGB(255, 215, 215, 215);

  static const blackColor600 = Color(0xFF13201C);
  static const blackColor300 = Color(0xFF626C69);

  static const textColor = Color.fromARGB(255, 85, 86, 86);
  static const productBackground = Color(0xFFEEEBE5);
  //static const canvasBackground = Color(0xFFF9F8F4);

  static const pageBg = canvasColor;

  static const transparent = Color(0x00FFFFFF);
  static const divider = Color(0xFFE7ECF2);
  static const success = Color.fromARGB(255, 49, 170, 101);
  static const error = Color.fromARGB(255, 191, 43, 53);
  static const process = Color(0xFFffC640);
  static const links = Color(0xFF22B0FB);

  static const secondartTextColor = Color.fromARGB(255, 111, 111, 111);
  static const tertiaryTextColor = Color.fromARGB(255, 199, 199, 199);

  static const whiteColor = Color(0xFFFFFFFF);
  static const whiteColor75 = Color.fromARGB(249, 255, 255, 255);
  static const whiteColor50 = Color.fromARGB(210, 255, 255, 255);

  static final hoverColor = accentColorAlt.withOpacity(0.4);
  static final focusColor = accentColorAlt.withOpacity(0.1);

  static final splashColor = accentColor.withOpacity(0.3);
}
