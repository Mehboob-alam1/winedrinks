import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/common/styles/spacing_styles.dart';
import 'package:winedrinks/common/widgets/text_image/back_button.dart';

import '../../../../utlis/constants/WSizes.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/text_strings.dart';



class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: WSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WBackButton(onPressed: (){}),

            const SizedBox(height: WSizes.spaceBtwSections),
            Text(
              'Password',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: WSizes.sm),
            Text(WTexts.createANewPassword,style: Theme.of(context).textTheme.labelSmall),

            const SizedBox(height: WSizes.spaceBtwSections),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: WTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: WSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: WTexts.confirmPassword,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),

            const SizedBox(height: WSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: WColors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
                child:  const Text(WTexts.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
