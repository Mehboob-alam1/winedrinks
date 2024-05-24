import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/features/personalization/controllers/user_controller.dart';

import '../../../utlis/constants/image_strings.dart';
import '../images/w_circular_image.dart';


class WAppBar extends StatelessWidget {
  const WAppBar({
    super.key, required this.title,
  });



  final String title;
  @override

  Widget build(BuildContext context) {
    final controller= UserController.instance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Obx( () {
          final netWorkImage= controller.user.value.profilePicture;

          final image = netWorkImage.isNotEmpty ? netWorkImage : WImages.userImage;
          return  WCircularImage(
            image: image,
            width: 50,
            height: 50,
            isNetworkImage: netWorkImage.isNotEmpty,

          );
        }),

        Text(title,style: Theme.of(context).textTheme.headlineSmall),
        const Icon(Iconsax.menu_14,size: 24)
      ],
    );
  }
}
