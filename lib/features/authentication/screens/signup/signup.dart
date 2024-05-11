import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/common/widgets/login_signup/header_logo_title_subtitle.dart';
import 'package:winedrinks/features/authentication/screens/login/login.dart';
import 'package:winedrinks/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:winedrinks/features/authentication/screens/signup/widgets/signup_social_buttons.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/constants/text_strings.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/footer_text.dart';
import '../../../../common/widgets/login_signup/text_divider.dart';
import '../../../../utlis/constants/WSizes.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: WSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Login Title
              const WHeaderLogoTitle(
                  image: WImages.appLogo,
                  title: WTexts.signUp,
                  subtitle: WTexts.loginSubTitle),

              const SizedBox(height: WSizes.spaceBtwSections),

              /// Sign Up Form
              const SignUpForm(),

              const SizedBox(height: WSizes.spaceBtwSections),

              /// Divider
              const WTextDivider(text: WTexts.or),

              const SizedBox(height: WSizes.spaceBtwInputFields * 2),

              /// Social Buttons

              const SignUpSocialButtons(),

              /// Footer

              WFooterText(firstText: WTexts.alreadyHaveAccount,secondText: WTexts.login,onPressed: ()=>Get.to(()=>const LoginScreen())),

            ],
          ),
        ),
      ),
    );
  }
}

