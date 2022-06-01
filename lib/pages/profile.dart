import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

import '../widgets/m_list_tile.dart';

class ProfilePage extends StatelessWidget {
  static String id = '/profilePage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 8.0),
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: kBottomBarItemscolor,
                  child: CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('images/boy.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Don Scotus',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    color: kmonochromcolorwhite, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 50, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Invite your friends',
                      style: GoogleFonts.oswald(
                          color: kmonochromcolorwhite, fontSize: 14),
                    ),
                    Text(
                      'Copy link',
                      style: GoogleFonts.oswald(
                          color: kBottomBarItemscolor, fontSize: 14),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: kmonochromcolorwhite,
                ),
              ),
              ListTile(
                isThreeLine: true,
                leading: const Icon(
                  FontAwesomeIcons.gift,
                  color: kBottomBarItemscolor,
                  size: 50.0,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Invite and earn 20 EUR',
                    style: GoogleFonts.oswald(
                        color: kmonochromcolorwhite, fontSize: 18.0),
                  ),
                ),
                subtitle: Text(
                  'For every 2 friends who transfer over 200 EUR.',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolor2, fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: Text(
                  'Account services',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 16.0),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Divider(
                  color: kmonochromcolorwhite,
                ),
              ),
              MListTile(
                iconData: Icons.settings,
                text: 'General settings',
                onPress: () {
                  //do something
                },
              ),
              MListTile(
                iconData: Icons.account_balance,
                text: 'Account details',
                onPress: () {
                  //do something
                },
              ),
              MListTile(
                iconData: Icons.calendar_month,
                text: 'Scheduled transfers',
                onPress: () {
                  //do something
                },
              ),
              MListTile(
                iconData: Icons.fax,
                text: 'Receive by email or phone',
                onPress: () {
                  //do something
                },
              ),
              MListTile(
                iconData: Icons.menu_book,
                text: 'Statement of account',
                onPress: () {
                  //do something
                },
              ),
              MListTile(
                iconData: Icons.route,
                text: 'Automatic currency conversion',
                onPress: () {
                  //do something
                },
              ),
              MListTile(
                iconData: Icons.line_weight,
                text: 'Account limits',
                onPress: () {
                  //do something
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
