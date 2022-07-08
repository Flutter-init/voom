import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:voom/model/home_page_model.dart';
import 'package:voom/utility/constants.dart';
import 'dart:ui' as ui;

import 'package:voom/widgets/bottomSheet_listTile.dart';
import 'package:voom/widgets/login_button.dart';

class SuccessSendPage extends StatelessWidget {
  static String id = '/success';
  const SuccessSendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      appBar: AppBar(
        backgroundColor: kInactiveCardColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8),
            child: Text(
              'Congrats!',
              style: GoogleFonts.poppins(
                  fontSize: 40, color: kmonochromcolorwhite),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8),
            child: Text(
              "You've successfully sent money",
              style: GoogleFonts.poppins(fontSize: 20, color: kmonochromcolor2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Transfer details',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: kmonochromcolorwhite,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('images/pop-new-year.json', height: 200),
                      Lottie.asset('images/confetti.json', height: 100),
                    ],
                  ),
                  Text(
                    '\$310',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: kSendFABcolor,
                        fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      '*note that the tansfer could take up to 24 hours',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: kmonochromcolor2,
                      ),
                    ),
                  ),
                  const Divider(
                    color: kActiveCardColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      'Recipient',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: kmonochromcolorwhite,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  BottomSheetListTile(
                    avaColor: kmonochromcolorwhite,
                    iconColor: kInactiveCardColor,
                    iconData: FontAwesomeIcons.userInjured,
                    subtitle: 'jennydivy@mailer.com',
                    title: 'Jennifer Davis',
                    titleColor: kmonochromcolorwhite,
                  ),
                ],
              ),
              decoration: kContainerDeco.copyWith(color: kActiveCardColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: myLoginButton(
                mtext: 'Continue',
                onPress: () {
                  Navigator.popAndPushNamed(context, HomeState.id);
                }),
          ),
        ],
      ),
    );
  }
}
