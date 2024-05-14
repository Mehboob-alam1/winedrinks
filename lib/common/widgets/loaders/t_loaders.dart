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
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
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
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds:  duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check,color: WColors.white),
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
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2,color: WColors.white),
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
      duration: const Duration(seconds:  3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2,color: WColors.white),
    );
  }

}