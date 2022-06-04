import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

class mySocialMediaButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  mySocialMediaButton(this.iconData, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: kmonochromcolor2,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: kActiveCardColor,
        child: IconButton(
          color: kBottomBarItemscolor,
          onPressed: () {},
          icon: Icon(
            iconData,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
