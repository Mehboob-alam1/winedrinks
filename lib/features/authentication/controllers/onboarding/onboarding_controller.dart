import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index When Page Scrolls

  void updatePageIndicator(index) {}

  /// Jump to the specific dot selected page

  void dotNavigationClicked(index) {}

  /// Update current index and jum to next page
  void nextPage() {}

  /// Update current index and jump to last page

  void skipPage() {}
}
