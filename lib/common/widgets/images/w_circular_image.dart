import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utlis/constants/WSizes.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/helpers/helper_funtions.dart';
import '../../../utlis/shimmer/w_shimmer_effect.dart';


class WCircularImage extends StatelessWidget {
  const WCircularImage({
    super.key,
    this.fit=BoxFit.contain,
    required this.image,
    this.isNetworkImage=false,
    this.overlayColor,
    this.backgroundColor,
    this.width=100,
    this.height=100,
    this.padding=WSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = WHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(WSizes.sm),
      decoration: BoxDecoration(
        color: backgroundColor == null? dark ? WColors.black : WColors.white :null,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
           ? CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder: (context,url,downloadProgress) =>const WShimmerEffect(width: 55, height:55,radius: 55),
            errorWidget: (context,url,error) =>const Icon(Icons.error),
          )
              : Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}