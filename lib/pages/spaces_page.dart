import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/constants.dart';
import 'package:voom/widgets/my_card.dart';

class SpacesPage extends StatelessWidget {
  static String id = '/spacesPage';
  const SpacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Spaces',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  '\$5,000.00',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 60),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.visibility,
                      color: kmonochromcolor2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Total balance',
                      style: GoogleFonts.oswald(
                          color: kmonochromcolor2, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MyReusableCard(
                          cardChild: const Icon(
                            Icons.savings,
                            color: kBottomBarItemscolor,
                            size: 60,
                          ),
                          colour: kActiveCardColor,
                          width: 150,
                          height: 150),
                      Text(
                        'Main account',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolorwhite, fontSize: 16),
                      ),
                      Text(
                        '\$2,000.00',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolor2, fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      MyReusableCard(
                          cardChild: const Icon(
                            Icons.real_estate_agent,
                            color: kBottomBarItemscolor,
                            size: 60,
                          ),
                          colour: kActiveCardColor,
                          width: 150,
                          height: 150),
                      Text(
                        'Loan',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolorwhite, fontSize: 16),
                      ),
                      Text(
                        '\$1,000.00',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolor2, fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MyReusableCard(
                          cardChild: const Icon(
                            FontAwesomeIcons.sackDollar,
                            color: kBottomBarItemscolor,
                            size: 60,
                          ),
                          colour: kActiveCardColor,
                          width: 150,
                          height: 150),
                      Text(
                        'Investment',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolorwhite, fontSize: 16),
                      ),
                      Text(
                        '\$1,500.00',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolor2, fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      MyReusableCard(
                          cardChild: const Icon(
                            Icons.emergency,
                            color: kBottomBarItemscolor,
                            size: 60,
                          ),
                          colour: kActiveCardColor,
                          width: 150,
                          height: 150),
                      Text(
                        'Emergency account',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolorwhite, fontSize: 16),
                      ),
                      Text(
                        '\$500.00',
                        style: GoogleFonts.oswald(
                            color: kmonochromcolor2, fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
