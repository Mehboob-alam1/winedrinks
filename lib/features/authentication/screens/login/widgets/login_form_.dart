import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/navigation_menu.dart';

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
    return Form(
      child: Column(
        children: [
          /// Email
          TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: WTexts.email)),
          const SizedBox(height: WSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: WTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
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
                  Checkbox(value: true, onChanged: (value) {}),
                   Text(WTexts.rememberMe,style: Theme.of(context).textTheme.labelLarge),
                ],
              ),

              /// Forget Password

              TextButton(
                  onPressed: ()=> Get.to(()=>const ForgetPassWord()),
                  child: const Text(
                    WTexts.forgetPassword,
                    style: TextStyle(color: WColors.primary,fontFamily: 'Poppins',fontSize: 12),
                  ))
            ],
          ),
          const SizedBox(height: WSizes.spaceBtwSections),

          /// Login Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ()=>Get.to(()=>const NavigationMenu()),
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: WColors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
              child:  const Text(WTexts.login),
            ),
          ),
        ],
      ),
    );
  }
}
