import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/view/login_page.dart';
import 'package:voom/utility/constants.dart';

import '../widgets/m_list_tile.dart';
import '../widgets/simpleCardListTile.dart';

class SettingsPage extends StatefulWidget {
  static String id = '/settingsPage';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  bool _isRTSwitchOn = false;
  bool _isRTFSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.xmark, color: kSendFABcolor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: kInactiveCardColor,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  'General settings',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                    child: Text(
                      'Security',
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 14.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    child: Divider(
                      color: kmonochromcolorwhite,
                    ),
                  ),
                  const SimpleCardListTile(
                      avatarColor: kActiveCardColor,
                      cardColor: kActiveCardColor,
                      textColor: kmonochromcolorwhite,
                      subTextColor: kmonochromcolor2,
                      avatarChild: Icon(
                        FontAwesomeIcons.envelope,
                        color: kmonochromcolorwhite,
                      ),
                      text: 'Email settings',
                      subText: 'barbara.scott@voom.com'),
                  const SimpleCardListTile(
                      avatarColor: kActiveCardColor,
                      cardColor: kActiveCardColor,
                      textColor: kmonochromcolorwhite,
                      subTextColor: kmonochromcolor2,
                      avatarChild: Icon(
                        Icons.lock,
                        color: kmonochromcolorwhite,
                      ),
                      text: 'Change password',
                      subText: '******'),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(color: kActiveCardColor,
                      child: MListTile(
                        iconData: Icons.fingerprint,
                        text: 'Use fingerprint to log in',
                        onPress: () {
                          //do something;
                        },
                        trailing: Switch(
                            activeColor: kSendFABcolor,
                            inactiveThumbColor: kmonochromcolor2,
                            value: _isRTFSwitchOn,
                            onChanged: (bool value) {
                              setState(() {
                                _isRTFSwitchOn = value;
                              });
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      'Account actions',
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 14.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    child: Divider(
                      color: kmonochromcolorwhite,
                    ),
                  ),
                  MListTile(
                    iconData: FontAwesomeIcons.user,
                    text: 'Personal details',
                    onPress: () {
                      //do something;
                    },
                  ),
                  MListTile(
                    iconData: Icons.notifications,
                    text: 'Push Notifications',
                    onPress: () {
                      //do something;
                    },
                    trailing: Switch(
                        activeColor: kSendFABcolor,
                        inactiveThumbColor: kmonochromcolor2,
                        value: _isRTSwitchOn,
                        onChanged: (bool value) {
                          setState(() {
                            _isRTSwitchOn = value;
                          });
                        }),
                  ),
                  MListTile(
                    iconData: Icons.translate,
                    text: 'App Language',
                    onPress: () {
                      //do something;
                    },
                  ),
                  MListTile(
                    iconData: Icons.logout,
                    text: 'Sign out',
                    onPress: () {
                      Navigator.popAndPushNamed(context, LoginScreen.id);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    child: Divider(
                      color: kmonochromcolorwhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text(
                      'Voom v1.00.1',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 14.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 10.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Privacy policy',
                        style: GoogleFonts.poppins(
                            color: kSendFABcolor, fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
