import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/features/authentication/controllers/signup/signup_controller.dart';
import 'package:winedrinks/utlis/validators/validation.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          /// Name
          TextFormField(
            validator: (value) => WValidator.validateEmptyText('Name', value),
            controller: controller.name,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: WTexts.name,
            ),
          ),

          const SizedBox(height: WSizes.spaceBtwInputFields),

          /// User Name
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                WValidator.validateEmptyText('User name', value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: WTexts.userName,
            ),
          ),
          const SizedBox(height: WSizes.spaceBtwInputFields),

          TextFormField(
              controller: controller.email,
              validator: (value) => WValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: WTexts.email)),
          const SizedBox(height: WSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => WValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: WTexts.password,
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value= !controller.hidePassword.value,
                    icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash :Iconsax.eye)),
              ),
            ),
          ),

          const SizedBox(height: WSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      color: WColors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
              child: const Text(WTexts.signUp),
            ),
          ),
        ],
      ),
    );
  }
}
