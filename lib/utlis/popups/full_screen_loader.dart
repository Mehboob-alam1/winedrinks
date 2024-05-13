
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/utlis/constants/colors.dart';
import 'package:winedrinks/utlis/helpers/helper_funtions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class WFullScreenLoader {

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: WHelperFunctions.isDarkMode(Get.context!) ?WColors.dark : WColors.light,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              WAnimationLoaderWidget(text: text,animation:animation,)
            ],
          ),
        ),
      ),
    );
  }


  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
