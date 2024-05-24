import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/common/styles/spacing_styles.dart';
import 'package:winedrinks/common/widgets/containers/w_rounded_container.dart';
import 'package:winedrinks/features/drinks/screens/notes/new_notes/widgets/w_criteria_text.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';

import '../../../../../common/widgets/text_image/back_button.dart';
import '../../../../../navigation_menu.dart';

class NewNotesScreen extends StatelessWidget {
  const NewNotesScreen({super.key});

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
                  WBackButton(
                      onPressed: () => Get.off(() => const NavigationMenu())),
                  Text('New Notes',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Icon(Iconsax.menu_14, size: 24),
                ],
              ),

              /// Criteria QR Code

              const SizedBox(height: WSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: WRoundedContainer(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(WSizes.defaultSpace),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.qr_code_2_sharp, size: 60),
                              const SizedBox(height: WSizes.spaceBtwItems),
                              Text(
                                'Scan QR Code',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: WSizes.md),
                    const Expanded(
                      child: Column(
                        children: [
                          WCriteriaText(
                              criteria: 'Criteria 1', criteriaValue: '1/30'),
                          WCriteriaText(
                              criteria: 'Criteria 2', criteriaValue: '1/30'),
                          WCriteriaText(
                              criteria: 'Criteria 3', criteriaValue: '1/30'),
                          Divider(),
                          WCriteriaText(
                              criteria: 'Total', criteriaValue: '3/90'),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: WSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Text('Add Manually Wine Info'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
