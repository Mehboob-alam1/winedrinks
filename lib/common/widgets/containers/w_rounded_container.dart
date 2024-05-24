import 'package:flutter/material.dart';

import '../../../utlis/constants/WSizes.dart';
import '../../../utlis/constants/colors.dart';


class WRoundedContainer extends StatelessWidget {
  const WRoundedContainer({super.key,this.width,
    this.height,
    this.radius = WSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = WColors.borderPrimary,
    this.backgroundColor = WColors.white,
    this.padding,
    this.margin});
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor):null,

      ),
      child: child,
    );
  }
}
