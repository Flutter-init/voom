import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

class MyCircleAvatar extends StatelessWidget {
  late final double circleRadius;
  // late final IconData iconData;
  // late final Color iconColor;
  // late final double iconSize;
  late final String img;
  late final Color avataBackCOlor;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  MyCircleAvatar(
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
      // child: Icon(
      //   iconData,
      //   size: iconSize,
      //   color: iconColor,
      // ),
      backgroundColor: avataBackCOlor,
      child: Image(
        image: AssetImage(img),
      ),
    );
  }
}
