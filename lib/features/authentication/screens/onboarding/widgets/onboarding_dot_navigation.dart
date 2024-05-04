import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:winedrinks/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/devices/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: WDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: WSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClicked,
        count: 3,
        effect: const ExpandingDotsEffect(activeDotColor: WColors.primary,dotHeight: 6),
      ),
    );
  }
}
