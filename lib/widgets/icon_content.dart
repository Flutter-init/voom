import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utility/constants.dart';

/////////////////////////////////////////////////////////////////////////////////
// define class for reuseable card child
class IconContent extends StatelessWidget {
  // properties
  final IconData? cardIcons;
  final String cardText2;
  final String cardText1;

  // constructor
  IconContent({this.cardIcons, this.cardText1 = '', required this.cardText2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcons,
          size: 30.0,
          color: kmonochromcolorwhite,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Text(
              cardText1,
              style:
                  GoogleFonts.poppins(fontSize: 20, color: kmonochromcolorwhite),
            ),
            // height: 15.0,
          ),
        ),
        Text(
          cardText2,
          style: GoogleFonts.poppins(fontSize: 15, color: kmonochromcolor2),
        ),
      ],
    );
  }
}
