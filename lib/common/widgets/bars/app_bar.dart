import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class WAppBar extends StatelessWidget {
  const WAppBar({
    super.key, required this.image,  this.isNetworkImage=false, required this.title,
  });

  final String image;
  final bool isNetworkImage;
  final String title;
  @override

  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(

          radius: 24,
          backgroundImage:AssetImage(image),
        ),
        Text(title,style: Theme.of(context).textTheme.headlineSmall),
        const Icon(Iconsax.menu_14,size: 24)
      ],
    );
  }
}
