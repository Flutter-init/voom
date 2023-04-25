import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/simple_card_list_tile.dart';

class SpacesPage extends StatefulWidget {
  static String id = '/spaces_page';
  const SpacesPage({Key? key}) : super(key: key);

  @override
  State<SpacesPage> createState() => _SpacesPageState();
}

class _SpacesPageState extends State<SpacesPage> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor: kInactiveCardColor,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  'What are you looking for?',
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 17.0),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 20,
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
                      subText:
                          'Get loan for your project with little interest'),
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
                  const SimpleCardListTile(
                      avatarColor: kBottomBarItemscolor,
                      cardColor: kActiveCardColor,
                      textColor: kmonochromcolorwhite,
                      subTextColor: kmonochromcolor2,
                      avatarChild: Icon(FontAwesomeIcons.magnifyingGlassDollar),
                      text: 'Discover more',
                      subText: 'Search for interesting monetery opportunities'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
