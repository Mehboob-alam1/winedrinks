import 'package:flutter/material.dart';
import 'package:winedrinks/utlis/constants/WSizes.dart';
import 'package:winedrinks/utlis/constants/colors.dart';
import 'package:winedrinks/utlis/helpers/helper_funtions.dart';

class WHomeCard extends StatelessWidget {
  const WHomeCard({
    super.key,
    required this.height,
    required this.radius,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final double height;
  final double radius;
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = WHelperFunctions.isDarkMode(context);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 1,
          surfaceTintColor: dark ? WColors.dark : WColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 70,
                  height: 70,
                ),
                const SizedBox(height: WSizes.sm,),

                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
