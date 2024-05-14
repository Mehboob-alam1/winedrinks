import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:winedrinks/common/styles/spacing_styles.dart';

import '../../../utlis/constants/WSizes.dart';
import '../../../utlis/constants/text_strings.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: WSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
             Lottie.asset(image,width: MediaQuery.of(context).size.width*0.6),

              const SizedBox(height: WSizes.spaceBtwSections),

              ///Title & Sub Title

              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: WSizes.spaceBtwItems),

              Text(subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: WSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: const Text(WTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}