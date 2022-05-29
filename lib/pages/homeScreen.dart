import 'package:google_fonts/google_fonts.dart';
import 'package:voom/widgets/icon_content.dart';
import 'package:voom/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:voom/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

  final countryData = {
    "Euro": Icons.euro,
    "US Dollar": Icons.attach_money,
    "British Pound": Icons.currency_pound,
    "Canadian Dollar": FontAwesomeIcons.canadianMapleLeaf,
    "Chinese Yuan": Icons.currency_yuan,
    "Austrailian Dollar": FontAwesomeIcons.australSign,
    "Indian Rupee": Icons.currency_rupee,
    "Nigerian Naira": FontAwesomeIcons.nairaSign,
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const numItems = 20;

    Widget _buildRow() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '29 May 2022',
              style:
                  GoogleFonts.oswald(color: kmonochromcolorwhite, fontSize: 14),
            ),
          ),
          MyReusableCard(
            height: 100,
            width: width / 2,
            colour: kInactiveCardColor,
            cardChild: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: kmonochromcolorwhite,
                ),
                title: Text(
                  'Bought Fufu at beans up joint',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 15.0),
                ),
                subtitle: Text(
                  'Spent',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolor2, fontSize: 14.0),
                ),
                trailing: Text(
                  '\$ 20.0',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 15.0),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: kmonochromcolorwhite,
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: ListView(
        children: [
          Column(
            // mainAxisAlignment: Main,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MyReusableCard(
                      height: 150,
                      width: 150,
                      colour: kActiveCardColor,
                      cardChild: IconContent(
                        cardIcons: countryData['Nigerian Naira'],
                        cardText1: '200 000',
                        cardText2: 'Naira',
                      ),
                    ),
                    MyReusableCard(
                      height: 150,
                      width: 150,
                      colour: kActiveCardColor,
                      cardChild: IconContent(
                        cardIcons: countryData['Euro'],
                        cardText1: '2000',
                        cardText2: 'Euro',
                      ),
                    ),
                    MyReusableCard(
                      height: 150,
                      width: 150,
                      colour: kActiveCardColor,
                      cardChild: IconContent(
                        cardIcons: FontAwesomeIcons.plus,
                        cardText2: 'Add a currency',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, bottom: 20.0, top: 20.0),
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
                decoration: BoxDecoration(
                  color: kActiveCardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
