import 'package:flutter/material.dart';
import 'package:winedrinks/utlis/constants/colors.dart';


class WTextTheme{


  WTextTheme._();


  static TextTheme lightTextTheme=TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: WColors.dark,fontFamily: 'Poppins'),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: WColors.dark,fontFamily: 'Poppins'),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: WColors.dark,fontFamily: 'Poppins'),


    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: WColors.dark,fontFamily: 'Poppins'),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight:  FontWeight.w500,color: WColors.dark,fontFamily: 'Poppins'),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: WColors.dark,fontFamily: 'Poppins'),

    bodyLarge: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: WColors.dark,fontFamily: 'Poppins'),
    bodyMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: WColors.dark,fontFamily: 'Poppins'),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: WColors.dark.withOpacity(0.5),fontFamily: 'Poppins'),

    labelLarge: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: WColors.dark,fontFamily: 'Poppins'),
    labelSmall: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: WColors.dark.withOpacity(0.5),fontFamily: 'Poppins'),

  );
  static TextTheme darkTextTheme=TextTheme(

    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: WColors.light,fontFamily: 'Poppins'),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: WColors.light,fontFamily: 'Poppins'),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: WColors.light,fontFamily: 'Poppins'),


    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: WColors.light,fontFamily: 'Poppins'),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight:  FontWeight.w500,color: WColors.light,fontFamily: 'Poppins'),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: WColors.light,fontFamily: 'Poppins'),

    bodyLarge: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: WColors.light,fontFamily: 'Poppins'),
    bodyMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: WColors.light,fontFamily: 'Poppins'),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: WColors.light.withOpacity(0.5),fontFamily: 'Poppins'),

    labelLarge: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: WColors.light,fontFamily: 'Poppins'),
    labelSmall: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: WColors.light.withOpacity(0.5),fontFamily: 'Poppins'),

  );
}