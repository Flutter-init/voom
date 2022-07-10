import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

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
        child: cardChild,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
