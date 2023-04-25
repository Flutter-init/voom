// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class BottomSheetListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? iconData;
  final Function()? onPress;
  final Color avaColor;
  final Color iconColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? trailing;

  const BottomSheetListTile({
    this.iconData,
    required this.title,
    required this.subtitle,
    this.onPress,
    this.avaColor = kBottomBarItemscolor,
    this.iconColor = Colors.blueGrey,
    this.titleColor = kmonochromcolorBlack,
    this.subtitleColor = kmonochromcolor2,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: CircleAvatar(
        backgroundColor: avaColor,
        child: Icon(
          iconData,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(color: titleColor, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(color: subtitleColor, fontSize: 16),
      ),
      onTap: onPress,
    );
  }
}
