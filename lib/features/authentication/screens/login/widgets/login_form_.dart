import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/features/authentication/controllers/login/login_controller.dart';
import 'package:winedrinks/navigation_menu.dart';
import 'package:winedrinks/utlis/validators/validation.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';

class WLoginForm extends StatelessWidget {
  const WLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// Email
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
              validator: (value) => WValidator.validateEmptyText('Password',value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: WTexts.password,
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(height: WSizes.spaceBtwInputFields / 2),

          /// Remember Me & Forgot Password

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value)),
                  Text(WTexts.rememberMe,
                      style: Theme.of(context).textTheme.labelLarge),
                ],
              ),

              /// Forget Password

              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassWord()),
                  child: const Text(
                    WTexts.forgetPassword,
                    style: TextStyle(
                        color: WColors.primary,
                        fontFamily: 'Poppins',
                        fontSize: 12),
                  ))
            ],
          ),
          const SizedBox(height: WSizes.spaceBtwSections),

          /// Login Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.emailAndPasswordSignIn(),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      color: WColors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
              child: const Text(WTexts.login),
            ),
          ),
        ],
      ),
    );
  }
}
