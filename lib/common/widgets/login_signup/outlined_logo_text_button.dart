import 'package:flutter/material.dart';

import '../../../utlis/constants/WSizes.dart';
import '../../../utlis/constants/colors.dart';


class WOutlinedLogoTextButton extends StatelessWidget {
  const WOutlinedLogoTextButton({
    super.key, required this.image, required this.text, required this.onPressed,
  });

  final String image,text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(textStyle: const TextStyle(color: WColors.dark,fontFamily: 'Poppins',fontWeight: FontWeight.w600)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
             image,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: WSizes.spaceBtwSections / 2),
            Text(
              text,
            )
          ],
        ),
      ),
    );
  }
}
