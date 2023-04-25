// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class MyLoginButton extends StatelessWidget {
  final String mtext;
  VoidCallback onPress;
  // Callback Function() onPress;
  MyLoginButton({required this.mtext, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kBottomBarItemscolor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          mtext,
          style: GoogleFonts.poppins(color: kmonochromcolorBlack, fontSize: 20),
        ),
      ),
    );
  }
}
