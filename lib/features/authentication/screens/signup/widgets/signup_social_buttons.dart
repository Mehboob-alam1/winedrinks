import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/features/authentication/controllers/login/login_controller.dart';

import '../../../../../common/widgets/login_signup/outlined_logo_text_button.dart';
import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/text_strings.dart';


class SignUpSocialButtons extends StatelessWidget {
  const SignUpSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(LoginController());
    return Column(
      children: [
        WOutlinedLogoTextButton(
            image: WImages.googleLogo,
            text: WTexts.signupWithGoogle,
            onPressed: ()=>controller.googleSignIn()
        ),
        const SizedBox(height: WSizes.spaceBtwItems),
        WOutlinedLogoTextButton(
            image: WImages.facebookLogo,
            text: WTexts.signupWithFacebook,
            onPressed: () {}),
      ],
    );
  }
}
