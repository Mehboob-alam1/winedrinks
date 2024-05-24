import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:winedrinks/utlis/constants/colors.dart';
import 'package:winedrinks/utlis/helpers/helper_funtions.dart';

class WShimmerEffect extends StatelessWidget {
  const WShimmerEffect({super.key, required this.width, required this.height,  this.radius=15, this.color});

  final double width,height,radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark= WHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(

        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,

      child: Container(
        width:width ,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? WColors.darkerGrey : WColors.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}
