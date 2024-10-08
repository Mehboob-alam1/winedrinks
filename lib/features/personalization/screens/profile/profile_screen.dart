import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/common/widgets/images/w_circular_image.dart';
import 'package:winedrinks/features/personalization/controllers/profile_controller.dart';
import 'package:winedrinks/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utlis/constants/colors.dart';
import '../../controllers/user_controller.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController= Get.put(ProfileController());
    final controller= UserController.instance;

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
                const SizedBox(),

                  Text('Profile',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Icon(Iconsax.menu_14, size: 24)
                ],
              ),

              const SizedBox(height: WSizes.spaceBtwSections),

             Align(
               alignment: Alignment.topRight,
               child: GestureDetector(
                 onTap: ()=> Get.to(() => const EditProfileScreen()),
                 child: Container(
                   height: 40,
                   width: 120,
                   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                   // Add padding around text
                   decoration: BoxDecoration(
                    color: WColors.primary,
                     // Define the border color and width
                     borderRadius: BorderRadius.circular(
                         8.0), // Optional: if you need the border to be rounded
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       const Icon(Iconsax.edit,color: WColors.white,size: 20),
                    const SizedBox(width: WSizes.sm),
                    Text('Edit Profile',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: WColors.white),)
                     ],
                   )
                 ),
               ),
             ),
              const SizedBox(height: WSizes.spaceBtwItems),

              Obx( () {
                final netWorkImage= controller.user.value.profilePicture;

                final image = netWorkImage.isNotEmpty ? netWorkImage : WImages.userImage;
                return  WCircularImage(
                  image: image,
                  width: 80,
                  height: 80,
                  isNetworkImage: netWorkImage.isNotEmpty,

                );
              }),
            //  const CircleAvatar(radius: 50, backgroundImage: AssetImage(WImages.profilePic)),

               WProfileMenu(title: 'Name', value: controller.user.value.name),
               WProfileMenu(title: 'Email Address', value: controller.user.value.email),
               WProfileMenu(title: 'Username', value: controller.user.value.userName),
               WProfileMenu(title: 'Password', value: controller.user.value.password),
              const WProfileMenu(title: 'Language', value: 'English', showDownArrow: true),
            ],
          ),
        ),
      ),
    );
  }
}
