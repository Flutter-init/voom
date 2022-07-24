// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hinText;
  final IconData? iconData;
  final TextInputType textInputType;
  final bool obscureText;
  late final Widget? suffixIcon;

  // var controller = TextEditingController();

  final TextEditingController? controller;
  Function(String)? onChange;

  MyTextFieldWidget(
      {required this.hinText,
      this.iconData,
      required this.textInputType,
      // required this.controller,
      this.suffixIcon,
      this.onChange,
      this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        // controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        controller: controller,
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
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kmonochromcolorwhite),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kmonochromcolor2),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
