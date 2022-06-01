import 'package:google_fonts/google_fonts.dart';
import 'package:voom/pages/send_page.dart';

import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/column_circleAvatar_text.dart';
import '../widgets/myListTileCard.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    const numItems = 20;

    Widget _buildRow() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          MyListTileCard(
            subTextColor: kmonochromcolor2,
            cardColor: kInactiveCardColor,
            textColor: kmonochromcolorwhite,
            avatarColor: kBottomBarItemscolor,
            header: '01 July 2022',
            text: 'Purchased XBox at Amazon',
            avatarChild: Icon(
              Icons.credit_card,
            ),
            subText: 'Spent',
            trailing: "\$30.00",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: kmonochromcolorwhite,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MColumnCircleNText(
                      onPress: () {
                        Navigator.pushNamed(context, SendPage.id);
                      },
                      iconData: FontAwesomeIcons.arrowUpRightFromSquare,
                      text: 'Send',
                    ),
                    MColumnCircleNText(
                      iconData: FontAwesomeIcons.download,
                      text: 'Request',
                    ),
                    MColumnCircleNText(
                      iconData: FontAwesomeIcons.moneyBillTrendUp,
                      text: 'Invest',
                    ),
                    MColumnCircleNText(
                      iconData: FontAwesomeIcons.hands,
                      text: 'Loan',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total balance',
                      style: GoogleFonts.oswald(
                          fontSize: 20, color: kmonochromcolorwhite),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kActiveCardColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        //do something
                      },
                      child: Text(
                        '\$5000.00',
                        style: GoogleFonts.oswald(
                            fontSize: 16, color: kmonochromcolorwhite),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  color: kmonochromcolorwhite,
                ),
              ),
              const MyListTileCard(
                header: 'Financial Overview',
                text: 'Voom savings account',
                avatarChild: Image(
                  image: AssetImage('images/logo.png'),
                ),
                subText: 'BE 2546 2321 3447\nDon Scotus',
                trailing: "\$3000.00",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, bottom: 20.0, top: 10.0),
                      child: Text(
                        'All activities',
                        style: GoogleFonts.oswald(
                            fontSize: 25, color: kmonochromcolorwhite),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // do something - statistics
                    },
                    icon: const Icon(
                      Icons.bar_chart,
                      color: kBottomBarItemscolor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //do something - search for
                    },
                    icon: const Icon(
                      Icons.search,
                      color: kBottomBarItemscolor,
                    ),
                  ),
                ],
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 10),
                height: height * 0.5,
                child: ListView.builder(
                  controller: _controller,
                  itemCount: numItems,
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (BuildContext context, int i) {
                    return _buildRow();
                  },
                ),
                decoration: kContainerDeco,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
