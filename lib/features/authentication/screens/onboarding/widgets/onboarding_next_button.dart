import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/devices/device_utility.dart';



class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: WSizes.defaultSpace,
      bottom: WDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}