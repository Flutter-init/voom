import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

class CompleteRegistration extends StatelessWidget {
  static String id = '/completereg';
  const CompleteRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      appBar: AppBar(
        backgroundColor: kInactiveCardColor,
        elevation: 0.0,
      ),
    );
  }
}
