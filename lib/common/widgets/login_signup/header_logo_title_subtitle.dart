import 'package:flutter/material.dart';

import '../../../utlis/constants/WSizes.dart';


class WHeaderLogoTitle extends StatelessWidget {
  const WHeaderLogoTitle({
    super.key, this.image, this.title, this.subtitle,
  });

  final image,title,subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 80,
          height: 80,
        ),

        const SizedBox(height: WSizes.spaceBtwSections / 2),

        /// Title
        Text(title,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: WSizes.sm),
        /// Sub title
        Text(subtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
