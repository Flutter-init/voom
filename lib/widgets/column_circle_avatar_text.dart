import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class MyColumnCircleAvaterNText extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final Color avatarColor;
  final String text;
  final VoidCallback? onPress;
  MyColumnCircleAvaterNText(
      {this.avatarColor = kActiveCardColor,
      this.iconColor = kBottomBarItemscolor,
      required this.iconData,
      required this.text,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: avatarColor,
            child: IconButton(
              icon: Icon(
                iconData,
                color: iconColor,
              ),
              onPressed: onPress,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            text,
            style:
                GoogleFonts.poppins(color: kmonochromcolorwhite, fontSize: 16),
          ),
        )
      ],
    );
  }
}
