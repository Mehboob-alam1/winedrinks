import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/common/widgets/text_image/back_button.dart';
import 'package:winedrinks/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utlis/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  WBackButton(onPressed: () {}),
                  Text('Profile',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Icon(Iconsax.menu_14, size: 24)
                ],
              ),

              const SizedBox(height: WSizes.spaceBtwSections),

             Align(
               alignment: Alignment.topRight,
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
              const SizedBox(height: WSizes.spaceBtwItems),

              Stack(children: [
                const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(WImages.profilePic)),
                Positioned(
                    bottom: 5,
                    right: 10,
                    child: Image.asset(WImages.imgEdit, height: 25, width: 25)),
              ]),

              const WProfileMenu(title: 'Name', value: 'Mehboob'),
              const WProfileMenu(
                  title: 'Email Address', value: 'mehboobcodes@gmail.com'),
              const WProfileMenu(title: 'Username', value: '@mehboob12'),
              const WProfileMenu(title: 'Password', value: '*******'),
              const WProfileMenu(
                  title: 'Language', value: 'English', showDownArrow: true),
            ],
          ),
        ),
      ),
    );
  }
}
