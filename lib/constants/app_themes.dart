import 'package:flutter/material.dart';
import 'package:todoist/constants/color_constants.dart';

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorConstants.lightBackPrimary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConstants.lightBlue,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.lightBackPrimary,
      //toolbarHeight: 56,
    ),

    dividerTheme: DividerThemeData(
      color: ColorConstants.lightSupportSeparator,
      thickness: 0.5,
    ),

    // switchTheme: SwitchThemeData(
    //   splashRadius: 20,
    //   thumbColor: MaterialStateProperty.resolveWith((states) {
    //     if (states.contains(MaterialState.disabled)) {
    //       return ColorConstants.lightBackElevated;
    //     }
    //     return ColorConstants.lightBlue;
    //   }),

    //   trackColor: MaterialStateProperty.resolveWith((states) {
    //     if (states.contains(MaterialState.disabled)) {
    //       return ColorConstants.lightSupportOverlay;
    //     }
    //     return ColorConstants.lightBlue.withOpacity(0.3);
    //   }),
    // ),

    // checkboxTheme: CheckboxThemeData(
    //   checkColor: Colors.white,
    // ),
    //fontFamily: 'Roboto',
    textTheme: const TextTheme(
      // Large title
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.lightLabelPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),

      // Title
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.lightLabelPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),

      // BUTTON
      labelMedium: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.lightLabelPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      // Body
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.lightLabelPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      // Subhead
      bodySmall: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.lightLabelPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorConstants.darkBackPrimary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConstants.darkBlue,
    ),

    // checkboxTheme: CheckboxThemeData(
    //   checkColor: Colors.white,
    // ),
    //fontFamily: 'Roboto',
    textTheme: const TextTheme(
      // Large title
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.darkLabelPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),

      // Title
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.darkLabelPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),

      // BUTTON
      labelMedium: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.darkLabelPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      // Body
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.darkLabelPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      // Subhead
      bodySmall: TextStyle(
        fontFamily: 'Roboto',
        color: ColorConstants.darkLabelPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
