import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class DrawerListTile extends StatelessWidget {
  final String txt;
  final IconData icon;
  VoidCallback onPress;

  DrawerListTile(
      {required this.icon, required this.onPress, required this.txt});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          txt,
          style: GoogleFonts.poppins(fontSize: 14, color: kmonochromcolorwhite),
        ),
        leading: Icon(
          icon,
          color: kmonochromcolorwhite,
        ),
        onTap: onPress);
  }
}
