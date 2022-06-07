import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class myTextFieldWidget extends StatelessWidget {
  final String hinText;
  final IconData? iconData;
  final TextInputType textInputType;
  final bool obscureText;
  late final Widget? suffixIcon;

  myTextFieldWidget(
      {required this.hinText,
      this.iconData,
      required this.textInputType,
      this.suffixIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        obscureText: obscureText,
        keyboardType: textInputType,
        style: GoogleFonts.poppins(color: kmonochromcolorwhite),
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: GoogleFonts.poppins(color: kmonochromcolorwhite),
          prefixIcon: Icon(
            iconData,
            color: kmonochromcolor2,
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kmonochromcolorwhite),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kmonochromcolor2),
          ),
        ),
        onChanged: (value) {
          // do something
        },
      ),
    );
  }
}
