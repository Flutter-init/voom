import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

import '../widgets/simpleCardListTile.dart';

class SliverAppBarExample extends StatefulWidget {
  static String id = '/test';
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // bottom: PreferredSize(
              //   child: Text(
              //     'data',
              //     style: GoogleFonts.oswald(color: kmonochromcolorwhite),
              //   ),
              //   preferredSize: Size.fromHeight(100),
              // ),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                )
              ],
              // centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: kInactiveCardColor,
              pinned: this._pinned,
              snap: this._snap,
              floating: this._floating,
              expandedHeight: 140.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: kBottomBarItemscolor,
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/boy.png'),
                        ),
                      ),
                    ),
                  ),
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
                  
                  
                ],
              ),
            ),
            // If the main content is a list, use SliverList instead.
            // SliverFillRemaining(
            //   hasScrollBody: false,
            //   child: Center(
            //     child: SingleChildScrollView(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: [
            //           const SizedBox(
            //             height: 20,
            //           ),
           
          ],
        ),
      ),
    );
  }
}
