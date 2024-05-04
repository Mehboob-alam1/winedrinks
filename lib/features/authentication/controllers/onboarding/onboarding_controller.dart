import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index When Page Scrolls

  void updatePageIndicator(index) => currentPageIndex.value=index;

  /// Jump to the specific dot selected page

  void dotNavigationClicked(index) {
    currentPageIndex.value= index;
    pageController.jumpTo(index);
  }

  /// Update current index and jum to next page
  void nextPage() {
    if(currentPageIndex.value==2){
       Get.offAll(const LoginScreen());
    }else{
      int page= currentPageIndex.value+1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current index and jump to last page

  void skipPage() {
    Get.offAll(const LoginScreen());
  }
}
