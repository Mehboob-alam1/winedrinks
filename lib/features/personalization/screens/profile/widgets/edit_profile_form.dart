import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/features/personalization/controllers/profile_controller.dart';
import 'package:winedrinks/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../../utlis/constants/WSizes.dart';
import '../../../controllers/user_controller.dart';

class WEditProfileForm extends StatelessWidget {
  const WEditProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(ProfileController());

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name
          Text('Name', style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
          const SizedBox(height: WSizes.spaceBtwItems / 2),
          TextFormField(controller: controller.name,decoration: const InputDecoration(suffixIcon: Icon(Iconsax.edit))),

          const SizedBox(height: WSizes.spaceBtwInputFields),
          /// Email

          Text('Email', style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
          const SizedBox(height: WSizes.spaceBtwItems / 2),
          TextFormField(controller: controller.email,decoration: const InputDecoration(suffixIcon: Icon(Iconsax.edit))),

          const SizedBox(height: WSizes.spaceBtwInputFields),
          /// User Name

          Text('User name', style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
          const SizedBox(height: WSizes.spaceBtwItems / 2),
          TextFormField(controller: controller.userName,decoration: const InputDecoration(suffixIcon: Icon(Iconsax.edit))),



          const SizedBox(height: WSizes.spaceBtwInputFields),
          /// Password

          Text('Password', style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
          const SizedBox(height: WSizes.spaceBtwItems / 2),
          TextFormField(controller: controller.password,decoration: const InputDecoration(suffixIcon: Icon(Iconsax.edit))),

          const SizedBox(height: WSizes.spaceBtwInputFields),
          /// Language

          const WProfileMenu(title: 'Language', value: 'English',showDownArrow: true),

        ],
      ),
    );
  }
}
