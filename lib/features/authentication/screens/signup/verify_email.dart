import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/data/repositories/authentication/authentication_repository.dart';
import 'package:winedrinks/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/helpers/helper_funtions.dart';

import '../../../../utlis/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
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
              Text(email ?? '',
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
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(WTexts.tContinue),
                ),
              ),
              const SizedBox(height: WSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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
