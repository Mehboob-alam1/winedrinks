import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/common/styles/spacing_styles.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/constants/text_strings.dart';

import '../../../../common/widgets/bars/app_bar.dart';
import '../../../../common/widgets/card/home_card.dart';
import '../../../personalization/controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(UserController());
    return Scaffold(
      body: Padding(
        padding: WSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
             WAppBar(
                image: controller.user.value.profilePicture, isNetworkImage: false, title: 'Home'),

            const SizedBox(height: WSizes.spaceBtwSections),

            Column(
              children: [
                Row(
                  children: [
                    WHomeCard(height: 200, radius: 10, image: WImages.newNotes, title: WTexts.newNotes, subTitle: WTexts.startNewNote, onTap: () {  }),
                    const SizedBox(width: WSizes.spaceBtwItems/2),
                    WHomeCard(height: 200, radius: 10, image: WImages.myNotes, title: WTexts.myNotes, subTitle: WTexts.clickToSeeNotes, onTap: () {  }),
                  ],
                ),
              ],
            ),
const SizedBox(height: WSizes.spaceBtwItems),
            Row(
              children: [
                WHomeCard(height: 200, radius: 10, image: WImages.allNotes, title: WTexts.allNotes, subTitle: WTexts.clickToSeeNotes, onTap: () {  }),
                const SizedBox(width: WSizes.spaceBtwItems/2),

                WHomeCard(height: 200, radius: 10, image: WImages.myRating, title: WTexts.myRating, subTitle: WTexts.setupRating, onTap: () {  }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

