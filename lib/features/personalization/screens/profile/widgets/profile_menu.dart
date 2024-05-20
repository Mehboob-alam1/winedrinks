import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/colors.dart';

class WProfileMenu extends StatelessWidget {
  const WProfileMenu(
      {super.key,

      required this.title,
      required this.value, this.iconData=Iconsax.arrow_down_1,  this.showDownArrow=false});


  final String title, value;
  final IconData? iconData;
  final bool showDownArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: WSizes.spaceBtwItems / 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis),

          const SizedBox(height: WSizes.spaceBtwItems / 2),


          SizedBox(
            width: double.infinity,
            child: Container(

              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              // Add padding around text
              decoration: BoxDecoration(
                border: Border.all(color: WColors.grey),
                // Define the border color and width
                borderRadius: BorderRadius.circular(
                    4.0), // Optional: if you need the border to be rounded
              ),
              child: Padding(
                padding: const EdgeInsets.all(WSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value,
                    
                    
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis),
                    if(showDownArrow)
                      Icon(iconData)

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
