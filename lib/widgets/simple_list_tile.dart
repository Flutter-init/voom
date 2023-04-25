// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class MySimpleListTile extends StatelessWidget {
  final Function()? onPress;
  final IconData iconData;
  final String text;
  final Widget? trailing;
  MySimpleListTile(
      {this.onPress,
      required this.iconData,
      required this.text,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: CircleAvatar(
        backgroundColor: kActiveCardColor,
        child: Icon(
          iconData,
          color: kmonochromcolorwhite,
        ),
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(color: kmonochromcolorwhite, fontSize: 18),
      ),
      onTap: onPress,
    );
  }
}
