import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class MySocialMediaButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTouchColor;
  final Color textColor;
  final Color iconColor;
  final IconData icon;
  final String buttonText;
  final VoidCallback onPress;
  const MySocialMediaButton(
      {Key? key,
      required this.buttonColor,
      required this.buttonText,
      required this.icon,
      required this.onPress,
      this.buttonTouchColor = kActiveCardColor,
      required this.iconColor,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          overlayColor: MaterialStateProperty.all(buttonTouchColor),
        ),
        onPressed: onPress,
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(
          buttonText,
          style: GoogleFonts.poppins(color: textColor, fontSize: 15),
        ),
      ),
    );
  }
}
