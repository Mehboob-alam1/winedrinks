import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/common/styles/spacing_styles.dart';
import 'package:winedrinks/common/widgets/login_signup/text_divider.dart';
import 'package:winedrinks/features/authentication/screens/login/widgets/login_form_.dart';
import 'package:winedrinks/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:winedrinks/features/authentication/screens/signup/signup.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/footer_text.dart';
import '../../../../common/widgets/login_signup/header_logo_title_subtitle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: WSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo title & subtitle
              const WHeaderLogoTitle(image: WImages.appLogo,title: WTexts.login,subtitle: WTexts.loginSubTitle),

              const SizedBox(height: WSizes.spaceBtwSections),

              /// Form
              const WLoginForm(),

              /// Divider

              const SizedBox(height: WSizes.spaceBtwSections),
              const WTextDivider(text: WTexts.or),

              const SizedBox(height: WSizes.spaceBtwInputFields*2),
              const WSocialButtons(),

              const SizedBox(height: WSizes.spaceBtwSections+8),
              WFooterText(firstText: WTexts.dontHaveAccount,secondText: WTexts.signUp,onPressed: ()=>Get.to(()=>const SignUpScreen())),
            ],

          ),
        ),
      ),
    );
  }
}






