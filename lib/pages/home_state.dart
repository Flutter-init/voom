import 'package:google_fonts/google_fonts.dart';
import 'package:voom/pages/card_page.dart';
import 'package:voom/pages/homeScreen.dart';
import 'package:voom/pages/onboarding_page.dart';
import 'package:voom/pages/profile.dart';

import 'package:voom/pages/spaces_page.dart';
import '../widgets/drawer_listTile.dart';
import 'package:voom/widgets/logout_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_screen.dart';

class HomeState extends StatefulWidget {
  static const String id = '/';
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  int _selectedIndex = 0;
  final List _screens = [
    const HomeScreen(),
    const CardPage(),
    const SpacesPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kActiveCardColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            tooltip: 'Go home',
            icon: Icon(
              Icons.cottage,
              // color: kmoochromcolorwhite,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            tooltip: 'View cards',
            icon: Icon(
              Icons.credit_card,
              // color: kmoochromcolorwhite,
            ),
            label: 'Card',
          ),
          
          BottomNavigationBarItem(
            tooltip: 'View products',
            icon: Icon(
              Icons.workspaces,
              // color: kmoochromcolorwhite,
            ),
            label: 'Spaces',
          ),
          BottomNavigationBarItem(
            tooltip: 'View your account',
            icon: Icon(
              Icons.person,
              // color: kmoochromcolorwhite,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kBottomBarItemscolor,
        unselectedItemColor: kmonochromcolorwhite,
        selectedLabelStyle:
            GoogleFonts.oswald(fontSize: 14, color: kmonochromcolorwhite),
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        backgroundColor: kInactiveCardColor,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 50,
            ),
            DrawerListTile(
              txt: 'Home',
              onPress: () {
                Navigator.pushReplacementNamed(context, HomeState.id);
              },
              icon: Icons.cottage,
            ),
            DrawerListTile(
              txt: 'Help',
              onPress: () {},
              icon: Icons.help,
            ),
            DrawerListTile(
              txt: 'Feedback',
              onPress: () {},
              icon: Icons.message,
            ),
            DrawerListTile(
              txt: 'Invite a friend',
              onPress: () {
                Navigator.pushNamed(context, OnboardingPage.id);
              },
              icon: Icons.outgoing_mail,
            ),
            DrawerListTile(
              txt: 'Rate us',
              onPress: () {
                //do something
              },
              icon: Icons.thumbs_up_down_sharp,
            ),
            DrawerListTile(
              txt: 'About us',
              onPress: () {},
              icon: Icons.face,
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: double.infinity,
              child: MyLogOutListTile(
                  iconData: FontAwesomeIcons.arrowRightFromBracket,
                  text: 'Logout',
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kInactiveCardColor,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              icon: const Icon(
                Icons.widgets,
                // color: kmoochromcolorwhite,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
