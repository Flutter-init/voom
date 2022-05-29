import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/constants.dart';

class MyListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPress;

  const MyListTile(
      {required this.iconData, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 18, 100, 18),
      child: Center(
        child: MListTileNoPadding(
            onPress: onPress, iconData: iconData, text: text),
      ),
    );
  }
}

class MListTileNoPadding extends StatelessWidget {
  const MListTileNoPadding({
    Key? key,
    required this.onPress,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPress;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kActiveCardColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: kmonochromcolorwhite,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style:
                GoogleFonts.oswald(fontSize: 14, color: kmonochromcolorwhite),
          )
        ],
      ),
    );
  }
}
