import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/features/personalization/controllers/profile_controller.dart';
import 'package:winedrinks/features/personalization/controllers/user_controller.dart';
import 'package:winedrinks/features/personalization/screens/profile/profile_screen.dart';
import 'package:winedrinks/features/personalization/screens/profile/widgets/edit_profile_form.dart';
import 'package:winedrinks/utlis/constants/text_strings.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/text_image/back_button.dart';
import '../../../../utlis/constants/WSizes.dart';
import '../../../../utlis/constants/image_strings.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final userController= UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: WSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// App bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WBackButton(
                      onPressed: () => Get.off(() => const ProfileScreen())),
                  Text('Profile',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Icon(Iconsax.menu_14, size: 24)
                ],
              ),

              const SizedBox(height: WSizes.spaceBtwSections),

              Stack(children: [
                const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(WImages.profilePic)),
                Positioned(
                    bottom: 5,
                    right: 10,
                    child: GestureDetector(onTap:()=> userController.uploadUserProfilePicture(),child: Image.asset(WImages.imgEdit, height: 25, width: 25))),
              ]),

              const SizedBox(height: WSizes.spaceBtwSections),

              const WEditProfileForm(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=> controller.updateUserName(),
                  child: Text(WTexts.save),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


