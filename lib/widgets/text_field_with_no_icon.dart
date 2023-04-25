import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class TextFieldNoIcon extends StatefulWidget {
  final String hintext;
  final Function(String)? onChange;
  final TextInputType textInputType;
  // ignore: use_key_in_widget_constructors
  const TextFieldNoIcon(
      {this.onChange, required this.hintext, required this.textInputType});

  @override
  State<TextFieldNoIcon> createState() => _TextFieldNoIconState();
}

class _TextFieldNoIconState extends State<TextFieldNoIcon> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: widget.textInputType,
        style: GoogleFonts.poppins(color: kmonochromcolorwhite),
        decoration: InputDecoration(
          hintText: widget.hintext,
          hintStyle: GoogleFonts.poppins(color: kmonochromcolorwhite),
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
        onChanged: widget.onChange);
  }
}
