import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/features/authentication/screens/login/login.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/helpers/helper_funtions.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utlis/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        actions: [
          IconButton(onPressed:()=> Get.offAll(()=>const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WSizes.defaultSpace),


          child: Column(
            children: [
              Image(
                image: const AssetImage(WImages.deliveredEmailIllustration),
                width: WHelperFunctions.screenWidth() * 0.6,

              ),

              const SizedBox(height: WSizes.spaceBtwSections),



              Text(WTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: WSizes.spaceBtwItems),
              Text("mehboobcodes@gmail.com",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: WSizes.spaceBtwItems),
              Text(WTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: WSizes.spaceBtwSections),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                        () => SuccessScreen(
                      image: WImages.staticSuccessIllustration,
                      title: WTexts.yourAccountCreatedTitle,
                      subtitle: WTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
                  child: const Text(WTexts.tContinue),
                ),
              ),
              const SizedBox(height: WSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(WTexts.resendEmail),
                ),
              )
],
          ),
        ),
      ),
    );
  }
}
