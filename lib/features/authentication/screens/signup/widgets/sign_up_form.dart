import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/text_strings.dart';



class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Name
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: WTexts.name,
            ),
          ),

          const SizedBox(height: WSizes.spaceBtwInputFields),

          /// User Name
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: WTexts.userName,
            ),
          ),
          const SizedBox(height: WSizes.spaceBtwInputFields),

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

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: WColors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
              child:  const Text(WTexts.signUp),
            ),
          ),


        ],
      ),
    );
  }
}
