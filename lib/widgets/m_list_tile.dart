import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/constants.dart';

class MListTile extends StatelessWidget {
  final Function()? onPress;
  final IconData iconData;
  final String text;
  MListTile({this.onPress, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kInactiveCardColor,
        child: Icon(
          iconData,
          color: kmonochromcolorwhite,
        ),
      ),
      title: Text(
        text,
        style: GoogleFonts.oswald(color: kmonochromcolorwhite, fontSize: 18),
      ),
      onTap: onPress,
    );
  }
}
