import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/utlis/constants/colors.dart';
import 'package:winedrinks/utlis/helpers/helper_funtions.dart';

class WLoaders{


  WLoaders._();
static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

static customToast({required message}){
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      elevation: 0,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: WHelperFunctions.isDarkMode(Get.context!) ? WColors.darkerGrey.withOpacity(0.9) :WColors.grey.withOpacity(0.9),
        ),
        child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge)),
      ),
    )
  );
}


  static successSnackBar({required title,message ='',duration =3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: WColors.white,
      backgroundColor: WColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds:  duration),
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.check,color: WColors.white),
    );
  }



  static warningSnackBar({required title,message ='',duration =3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: WColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds:  duration),
      margin: EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2,color: WColors.white),
    );
  }

  static errorSnackBar({required title,message=''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: WColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds:  3),
      margin: EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2,color: WColors.white),
    );
  }

}