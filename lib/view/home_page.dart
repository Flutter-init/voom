import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/model/requestbottomSheet.dart';
import 'package:voom/model/sendbottomSheet.dart';
import 'package:voom/model/shared_prefs.dart';
import 'package:voom/view/bank_transfer_page.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voom/view/chart_page.dart';

import '../model/activity_data.dart';
import '../widgets/bottomSheet_listTile.dart';
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

  String _fullName = '';

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _fullName = prefs.getString(SharedPreferencesKeys.fullName.toString())!;
    return _fullName;
  }

  var items = [
    ActivityData(
        '01 July 2022', 'Purchased XBox at Amazon', 'Spent', '\$30.09'),
    ActivityData(
        '23 July 2022', 'Purchased PS4 at Ali Express', 'Spent', '\$50.09'),
    ActivityData('30 July 2022', 'Subscribed to netflix', 'Spent', '\$9.09'),
    ActivityData(
        '23 July 2022', 'Money to Jason statham', 'Received', '\$5000.09'),
  ];

  @override
  initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // var numItems = items.length;
    var numItems = 0;

    Widget _buildRow(ActivityData activityData) {
      //TODO: Make this _buildRow() method dynamic also. Therefore:
      //TODO: therefore, clear the list and if there is no recent activity display the text: 'All your transaction activities will show up here'
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyListTileCard(
            subTextColor: kmonochromcolor2,
            cardColor: kInactiveCardColor,
            textColor: kmonochromcolorwhite,
            avatarColor: kBottomBarItemscolor,
            header: activityData.header!,
            text: activityData.text!,
            avatarChild: const Icon(
              Icons.credit_card,
            ),
            subText: activityData.subText!,
            trailing: activityData.trailing!,
          ),
          const Padding(
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
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          backgroundColor: kmonochromcolorwhite,
                          context: context,
                          builder: (ctx) => BuildSendBottomSheet(contxt: ctx)
                              .getBottomSheet(),
                        );
                      },
                      iconData: FontAwesomeIcons.arrowUpRightFromSquare,
                      text: 'Send',
                    ),
                    MColumnCircleNText(
                      iconData: FontAwesomeIcons.download,
                      text: 'Request',
                      onPress: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (ctx) =>
                                BuildRequestBottomSheet(contxt: ctx)
                                    .getBottomSheet(),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            backgroundColor: kmonochromcolorwhite);
                      },
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
                      style: GoogleFonts.poppins(
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
                        style: GoogleFonts.poppins(
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
              MyListTileCard(
                header: 'Financial Overview',
                text: 'Voom savings account',
                avatarChild: Image(
                  image: AssetImage('images/logo.png'),
                ),
                //TODO: make the name dynamic by getting the name after registration and replacing it ***Barbara Scott***
                subText: _fullName.isEmpty
                    ? '8300000187\nNo name'
                    : '8300000187\n$_fullName',
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
                        style: GoogleFonts.poppins(
                            fontSize: 25, color: kmonochromcolorwhite),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ChartPage.id);
                      //TODO: draw history histogram
                      // do something - statistics
                      
                    },
                    icon: const Icon(
                      Icons.bar_chart,
                      color: kBottomBarItemscolor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO: search through all activities
                      //do something - search for
                      showSearch(
                          context: context,
                          delegate: SearchPage<String>(
                            builder: (property) =>
                                const ListTile(title: Text('Hi')),
                            items: ['Hi', 'Hello'],
                            filter: (property) => ['Hi'],
                            failure: const Center(
                              child: Text('Query not found'),
                            ),
                            searchStyle: const TextStyle(color: Colors.white),
                            barTheme: ThemeData(
                                primaryColor: Colors.white,
                                appBarTheme: const AppBarTheme(
                                    titleTextStyle:
                                        TextStyle(color: Colors.white),
                                    backgroundColor: kInactiveCardColor)),
                          ));
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
                child: numItems != 0
                    ? ListView.builder(
                        controller: _controller,
                        itemCount: numItems,
                        padding: const EdgeInsets.all(16.0),
                        itemBuilder: (BuildContext context, int index) {
                          return _buildRow(items[index]);
                        },
                      )
                    : Center(
                        child: Text(
                          'All your transaction activities will show up here',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
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
