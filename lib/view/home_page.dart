import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/model/request_button_bottomsheet.dart';
import 'package:voom/model/send_button_bottomsheet.dart';
import 'package:voom/model/shared_prefs.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voom/view/chart_page.dart';

import '../model/activity_data.dart';
import '../model/firestore_constants.dart';
import '../widgets/column_circle_avatar_text.dart';

import '../widgets/my_list_tile_card.dart';

class HomePage extends StatefulWidget {
  static const String id = '/homescreen';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  var items = [
    ActivityData(
        '01 July 2022', 'Purchased XBox at Amazon', 'Spent', '\$30.09'),
    ActivityData(
        '23 July 2022', 'Purchased PS4 at Ali Express', 'Spent', '\$50.09'),
    ActivityData('30 July 2022', 'Subscribed to netflix', 'Spent', '\$9.09'),
    ActivityData(
        '23 July 2022', 'Money to Jason statham', 'Received', '\$5000.09'),
  ];

  String? _docId;

  @override
  initState() {
    super.initState();
    getUserCredentials();
  }

  final userFromFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // var numItems = items.length;
    var numItems = 0;

    Widget _buildRow(ActivityData activityData) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyListTileCard(
            subTextColor: kmonochromcolor2,
            cardColor: kInactiveCardColor,
            textColor: kmonochromcolorwhite,
            avatarColor: kBottomBarItemscolor,
            header: activityData.header!,
            balance: numItems.toString(),
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
                    MyColumnCircleAvaterNText(
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
                    MyColumnCircleAvaterNText(
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
                    MyColumnCircleAvaterNText(
                      iconData: FontAwesomeIcons.moneyBillTrendUp,
                      text: 'Invest',
                    ),
                    MyColumnCircleAvaterNText(
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
                        '\$0.00',
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
              FutureBuilder<DocumentSnapshot>(
                future: userFromFirestore
                    .collection('Users')
                    .doc('Ephraim Umunnakwe: iZ569zga16Xuw59OeKOoNeqcud23')
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return const Text("Document does not exist");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return MyListTileCard(
                      balance: '\$0',
                      header: 'Financial Overview',
                      text: 'Voom savings account',
                      avatarChild: TextAvatar(
                        text: data[FireStoreConstants.fullName],
                        numberLetters: 2,
                      ),
                      subText: snapshot.hasData
                          ? '${data[FireStoreConstants.fullName]}'
                          : 'No name',
                      //TODO 2: If the user has used google or facebook to sign up/sign in
                      //then save the user.name, user.email also from Firebase locally and display it
                      trailing: "\$0.00",
                    );
                  }
                  return const MyListTileCard(
                    balance: '\$0.00',
                    header: 'Financial Overview',
                    text: 'Voom savings account',
                    avatarChild: Center(
                      child: CircularProgressIndicator(),
                    ),
                    subText: '...',
                    //TODO 2: If the user has used google or facebook to sign up/sign in
                    //then save the user.name, user.email also from Firebase locally and display it
                    trailing: "\$0.00",
                  );
                },
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
                      //TODO 3: try to fix it but This is not important. If it would take too much energy
                      // or time remove it
                    },
                    icon: const Icon(
                      Icons.bar_chart,
                      color: kBottomBarItemscolor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO 4: search through all activities
                      // This and the chart would be part of the ending task
                      // try to complete it, though it is not of priority now
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
                decoration: kContainerDeco,
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  getUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String docId = prefs.getString(SharedPreferencesModel.documentId) ?? '';
    setState(() {
      _docId = docId;
    });

    if (kDebugMode) {
      print("This is the document Id locally $_docId");
      print("This is the document Id storedinsharedprefs $docId");
    }
  }
}
