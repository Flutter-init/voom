import 'package:flutter/material.dart';
import 'package:voom/constants.dart';

class myCircleAvatar extends StatelessWidget {
  late final double circleRadius;
  // late final IconData iconData;
  // late final Color iconColor;
  // late final double iconSize;
  late final String img;
  late final Color avataBackCOlor;

  myCircleAvatar(
      {this.circleRadius = 40.0,
      // required this.iconData,
      // this.iconColor = kmoochromcolorwhite,
      // this.iconSize = 90.0,
      required this.img,
      this.avataBackCOlor = kmonochromcolorwhite});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleRadius,
      child: Image(
        image: AssetImage(img),
      ),
      // child: Icon(
      //   iconData,
      //   size: iconSize,
      //   color: iconColor,
      // ),
      backgroundColor: avataBackCOlor,
    );
  }
}
