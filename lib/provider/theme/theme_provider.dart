import 'package:flutter/material.dart';
import 'package:todoist/constants/color_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider(BuildContext context) {
    final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
    _themeMode =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  Color get supportSeparator => isDarkMode
      ? ColorConstants.darkSupportSeparator
      : ColorConstants.lightSupportSeparator;

  Color get supportOverlay => isDarkMode
      ? ColorConstants.darkSupportOverlay
      : ColorConstants.lightSupportOverlay;

  Color get labelPrimary => isDarkMode
      ? ColorConstants.darkLabelPrimary
      : ColorConstants.lightLabelPrimary;

  Color get labelSecondary => isDarkMode
      ? ColorConstants.darkLabelSecondary
      : ColorConstants.lightLabelSecondary;

  Color get labelTertiary => isDarkMode
      ? ColorConstants.darkLabelTertiary
      : ColorConstants.lightLabelTertiary;

  Color get labelDisable => isDarkMode
      ? ColorConstants.darkLabelDisable
      : ColorConstants.lightLabelDisable;

  Color get red =>
      isDarkMode ? ColorConstants.darkRed : ColorConstants.lightRed;

  Color get green =>
      isDarkMode ? ColorConstants.darkGreen : ColorConstants.lightGreen;

  Color get blue =>
      isDarkMode ? ColorConstants.darkBlue : ColorConstants.lightBlue;

  Color get gray =>
      isDarkMode ? ColorConstants.darkGray : ColorConstants.lightGray;

  Color get grayLight =>
      isDarkMode ? ColorConstants.darkGrayLight : ColorConstants.lightGrayLight;

  Color get white => Colors.white;

  Color get backPrimary => isDarkMode
      ? ColorConstants.darkBackPrimary
      : ColorConstants.lightBackPrimary;

  Color get backSecondary => isDarkMode
      ? ColorConstants.darkBackSecondary
      : ColorConstants.lightBackSecondary;

  Color get backElevated => isDarkMode
      ? ColorConstants.darkBackElevated
      : ColorConstants.lightBackElevated;

  String get apiColor => isDarkMode ? "#000000" : "#FFFFFF";
}
