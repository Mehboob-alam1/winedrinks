import 'package:flutter/material.dart';
import 'package:winedrinks/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../../../../utlis/devices/device_utility.dart';


class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: WDeviceUtils.getAppBarHeight(),
      right: WSizes.defaultSpace,
      child: TextButton(onPressed: ()=> OnBoardingController.instance.skipPage(), child: const Text(WTexts.skip)),
    );
  }
}