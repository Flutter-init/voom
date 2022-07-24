// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////
// my extracted class for container reuse
class MyReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;
  final double width;
  final double height;

  MyReusableCard({
    required this.colour, //
    this.cardChild,
    this.onPress,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return myReuseableMeth();
  }

  GestureDetector myReuseableMeth() {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
