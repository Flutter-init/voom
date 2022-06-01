import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/myListTileCard.dart';
import 'package:voom/widgets/my_card.dart';
import 'package:voom/widgets/simpleCardListTile.dart';

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
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: kContainerDeco,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, bottom: 15),
                  child: Text(
                    'What are you looking for?',
                    style: GoogleFonts.oswald(
                        color: kmonochromcolorwhite, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SimpleCardListTile(
                  avatarColor: kBottomBarItemscolor,
                  cardColor: kActiveCardColor,
                  textColor: kmonochromcolorwhite,
                  subTextColor: kmonochromcolor2,
                  avatarChild: Icon(
                    FontAwesomeIcons.buildingColumns,
                  ),
                  text: 'Investments',
                  subText:
                      'By yourself or with a little help from our experts'),
              const SimpleCardListTile(
                  avatarColor: kBottomBarItemscolor,
                  cardColor: kActiveCardColor,
                  textColor: kmonochromcolorwhite,
                  subTextColor: kmonochromcolor2,
                  avatarChild: Icon(Icons.real_estate_agent),
                  text: 'Lend out',
                  subText: 'Make money by helping others'),
              const SimpleCardListTile(
                  avatarColor: kBottomBarItemscolor,
                  cardColor: kActiveCardColor,
                  textColor: kmonochromcolorwhite,
                  subTextColor: kmonochromcolor2,
                  avatarChild: Icon(FontAwesomeIcons.hands),
                  text: 'Loan',
                  subText: 'Get loan for your project with little interest'),
              const SimpleCardListTile(
                  avatarColor: kBottomBarItemscolor,
                  cardColor: kActiveCardColor,
                  textColor: kmonochromcolorwhite,
                  subTextColor: kmonochromcolor2,
                  avatarChild: Icon(Icons.savings),
                  text: 'Saving',
                  subText: 'A buffer for unforseen situations'),
              const SimpleCardListTile(
                  avatarColor: kBottomBarItemscolor,
                  cardColor: kActiveCardColor,
                  textColor: kmonochromcolorwhite,
                  subTextColor: kmonochromcolor2,
                  avatarChild: Icon(FontAwesomeIcons.personCane),
                  text: 'Pension',
                  subText: 'To fully enjoy life later on'),
              const SimpleCardListTile(
                  avatarColor: kBottomBarItemscolor,
                  cardColor: kActiveCardColor,
                  textColor: kmonochromcolorwhite,
                  subTextColor: kmonochromcolor2,
                  avatarChild: Icon(
                    FontAwesomeIcons.houseCircleCheck,
                    size: 18,
                  ),
                  text: 'Mortgage',
                  subText: 'Make room for your dream'),
            ],
          ),
        ],
      ),
    );
  }
}
