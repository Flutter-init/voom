import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageUtils {
  static void voomSnackBarMessage(
      BuildContext context, String message, String action) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: (Colors.black),
      action: SnackBarAction(
        label: action,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void copyToClipBoardAndDisplayMessage(
      BuildContext context, String textToCopy, String textName) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((value) =>
        MessageUtils.voomSnackBarMessage(
            context, '$textName copied to Clipboard', 'OK'));
  }
}
