import 'package:flutter/material.dart';
import 'package:winedrinks/utlis/constants/colors.dart';

class WElevatedButtonTheme{

WElevatedButtonTheme._();


static final lightElevatedButtonTheme=ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,

    foregroundColor: Colors.white,
    backgroundColor: WColors.buttonPrimary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: WColors.buttonPrimary),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 16,color: WColors.white,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);


static final darkElevatedButtonTheme= ElevatedButtonThemeData(

  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor:WColors.buttonPrimary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: WColors.buttonPrimary),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);

}