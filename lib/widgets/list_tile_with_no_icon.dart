// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class ListTileNoIcon extends StatelessWidget {
  final Widget? trailing;
  final String title;
  final String subtitle;

  const ListTileNoIcon(
      {this.trailing, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(color: kmonochromcolorBlack, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(color: kmonochromcolor2, fontSize: 16),
      ),
      trailing: trailing,
    );
  }
}
