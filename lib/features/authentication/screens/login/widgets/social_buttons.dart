import 'package:flutter/material.dart';

import '../../../../../common/widgets/login_signup/outlined_logo_text_button.dart';
import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/text_strings.dart';

class WSocialButtons extends StatelessWidget {
  const WSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WOutlinedLogoTextButton(image: WImages.googleLogo,text: WTexts.loginWithGoogle,onPressed: (){}),
        const SizedBox(height: WSizes.spaceBtwItems),
        WOutlinedLogoTextButton(image: WImages.facebookLogo,text: WTexts.loginWithFacebook,onPressed: (){}),
      ],
    );
  }
}
