// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/constants.dart';

class MyListTileCard extends StatelessWidget {
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
  const MyListTileCard(
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
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        // shadowColor: kmonochromcolorwhite,
        color: cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, bottom: 5),
              child: Text(
                header,
                style: GoogleFonts.poppins(fontSize: 18, color: textColor),
              ),
            ),
            ListTile(
              onTap: () {
                //do something
              },
              // isThreeLine: true,
              leading: CircleAvatar(
                  backgroundColor: avatarColor, child: avatarChild),
              title: Text(
                text,
                style: GoogleFonts.poppins(fontSize: 16, color: textColor),
              ),
              subtitle: Text(
                subText,
                // 'BE 2546 2321 3447\nDon Scotus',
                style: GoogleFonts.poppins(fontSize: 16, color: subTextColor),
              ),
              trailing: Text(
                trailing,
                style: GoogleFonts.poppins(fontSize: 16, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
