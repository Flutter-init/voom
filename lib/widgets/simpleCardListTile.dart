import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/constants.dart';

class SimpleCardListTile extends StatelessWidget {
  final String text;
  final String header;
  final VoidCallback? onPress;
  final String trailing;
  final String subText;
  final Widget avatarChild;
  final Color cardColor;
  final Color textColor;
  final Color subTextColor;
  final Color avatarColor;
  const SimpleCardListTile(
      {this.header = '',
      required this.avatarChild,
      required this.text,
      this.trailing = '',
      required this.subText,
      this.onPress,
      this.cardColor = kBottomBarItemscolor,
      this.textColor = kmonochromcolorBlack,
      this.subTextColor = kmonochromcolor4,
      this.avatarColor = kmonochromcolorwhite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6,
        color: cardColor,
        child: ListTile(
          onTap: () {
            //do something
          },
          isThreeLine: true,
          leading:
              CircleAvatar(backgroundColor: avatarColor, child: avatarChild),
          title: Text(
            text,
            style: GoogleFonts.oswald(fontSize: 16, color: textColor),
          ),
          subtitle: Text(
            subText,
            // 'BE 2546 2321 3447\nDon Scotus',
            style: GoogleFonts.oswald(fontSize: 16, color: subTextColor),
          ),
          trailing: Text(
            trailing,
            style: GoogleFonts.oswald(fontSize: 16, color: textColor),
          ),
        ),
      ),
    );
  }
}
