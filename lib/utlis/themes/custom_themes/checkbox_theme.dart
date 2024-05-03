import 'package:flutter/material.dart';

import '../../constants/WSizes.dart';
import '../../constants/colors.dart';


class WCheckBoxTheme{

  WCheckBoxTheme._();


  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(WSizes.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return WColors.white;
      } else {
        return WColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return WColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(WSizes.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return WColors.white;
      } else {
        return WColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return WColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}