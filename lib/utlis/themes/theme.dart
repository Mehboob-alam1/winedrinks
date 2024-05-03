
import 'package:flutter/material.dart';
import 'package:winedrinks/utlis/constants/colors.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class WAppTheme{

WAppTheme._();


static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    primaryColor: WColors.primary,
    scaffoldBackgroundColor: WColors.light,
    textTheme: WTextTheme.lightTextTheme,
    elevatedButtonTheme: WElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: WOutlinedButtonTheme.lightOutlinedButtonTheme,
    appBarTheme: WAppBarTheme.lightAppBarTheme,
    checkboxTheme: WCheckBoxTheme.lightCheckboxTheme,
    inputDecorationTheme: WTextFormFieldTheme.lightInputDecorationTheme
     );

static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    brightness: Brightness.dark,
    primaryColor: WColors.primary,
    scaffoldBackgroundColor: WColors.dark,
    checkboxTheme: WCheckBoxTheme.darkCheckboxTheme,
    textTheme: WTextTheme.darkTextTheme,
    elevatedButtonTheme: WElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: WOutlinedButtonTheme.darkOutlinedButtonTheme,
    appBarTheme: WAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: WTextFormFieldTheme.darkInputDecorationTheme
);
}