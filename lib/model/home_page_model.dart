import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/services/firebase_service.dart';
import 'package:voom/view/card_page.dart';
import 'package:voom/view/home_page.dart';
import 'package:voom/view/profile_page.dart';

import 'package:voom/view/spaces_page.dart';
import 'shared_prefs.dart';
import '../widgets/drawer_list_tile.dart';
import 'package:voom/widgets/logout_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../view/login_page.dart';

class HomePageModel extends StatefulWidget {
  static const String id = '/';
  const HomePageModel({Key? key}) : super(key: key);

  @override
  State<HomePageModel> createState() => _HomePageModelState();
}

class _HomePageModelState extends State<HomePageModel> {
  int _selectedIndex = 0;
  final List _screens = [
    const HomePage(),
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
            GoogleFonts.poppins(fontSize: 14, color: kmonochromcolorwhite),
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
                Navigator.popAndPushNamed(context, HomePageModel.id);
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
                // Navigator.pushNamed(context, OnboardingPage.id);
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
                    logUserOut();
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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kInactiveCardColor,
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }

  Future<void> logUserOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(SharedPreferencesModel.email.toString());
    await preferences.setBool(
        SharedPreferencesModel.loginStatus.toString(), true);
    await FirebaseAuth.instance.signOut();
    await FirebaseService().signOutFromGoogle();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.id, (Route<dynamic> route) => false);
  }
}
