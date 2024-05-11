import 'package:flutter/material.dart';

import '../../../utlis/constants/WSizes.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';


class WBackButton extends StatelessWidget {
  const WBackButton({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Image.asset(WImages.backArrow,height: 16),
          const SizedBox(width: WSizes.sm),
          Text('Back',style: Theme.of(context).textTheme.labelLarge!.apply(color: WColors.primary)),
        ],
      ),
    );
  }
}
