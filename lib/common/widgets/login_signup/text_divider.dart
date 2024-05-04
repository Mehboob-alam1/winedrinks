import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/helpers/helper_funtions.dart';

class WTextDivider extends StatelessWidget {
  const WTextDivider({
    super.key, required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: WHelperFunctions.isDarkMode(context)
                ? WColors.darkerGrey
                : WColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(text, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: WHelperFunctions.isDarkMode(context)
                ? WColors.darkerGrey
                : WColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
