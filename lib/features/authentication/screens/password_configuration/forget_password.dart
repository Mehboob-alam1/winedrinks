import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/common/styles/spacing_styles.dart';
import 'package:winedrinks/common/widgets/text_image/back_button.dart';
import 'package:winedrinks/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';

import '../../../../utlis/constants/WSizes.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/text_strings.dart';

class ForgetPassWord extends StatelessWidget {
  const ForgetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: WSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            WBackButton(onPressed: (){}),
            const SizedBox(height: WSizes.spaceBtwSections),
            // ForgetHeader(),
            Column(
              children: [
                Image.asset(
                  WImages.appLogo,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: WSizes.sm),
                Text(
                  'Forget Password',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: WSizes.sm),
                Text(WTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelSmall),


                const SizedBox(height: WSizes.spaceBtwSections)
                ,        TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: WTexts.email)),

                const SizedBox(height: WSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=> Get.to(()=>const ResetPasswordScreen()),
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: WColors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
                    child:  const Text('Send code'),
                  ),
                ),

              ],
            ),

          ],

        ),
      ),

    );
  }
}
