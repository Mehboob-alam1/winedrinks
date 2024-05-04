import 'package:flutter/material.dart';

import '../../../utlis/constants/WSizes.dart';
import '../../../utlis/constants/colors.dart';


class WFooterText extends StatelessWidget {
  const WFooterText({
    super.key, required this.firstText, required this.secondText, required this.onPressed,
  });

  final String firstText,secondText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: WSizes.defaultSpace / 2),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            secondText,
            style: const TextStyle(
                color: WColors.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
