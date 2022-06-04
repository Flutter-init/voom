import 'package:google_fonts/google_fonts.dart';

import 'home_state.dart';

import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/social_media_button.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/login_button.dart';

class RegistrationScreen extends StatefulWidget {
  // variable for navigating to this screen
  static const String id = '/registration';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return kActiveCardColor;
      }
      return kActiveCardColor;
    }

    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: kActiveCardColor,
                    child: CircleAvatar(
                      backgroundColor: kmonochromcolorwhite,
                      radius: 20,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/logo.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Voom',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.oswald(
                        color: kmonochromcolorwhite, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mySocialMediaButton(
                        FontAwesomeIcons.facebookF, Colors.blue),
                    const SizedBox(
                      width: 15.0,
                    ),
                    mySocialMediaButton(FontAwesomeIcons.google, Colors.blue),
                    const SizedBox(
                      width: 15.0,
                    ),
                    mySocialMediaButton(FontAwesomeIcons.twitter, Colors.blue),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Or',
                  style: GoogleFonts.oswald(
                      color: kmonochromcolorwhite, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                myTextFieldWidget(
                  hinText: 'User name',
                  iconData: FontAwesomeIcons.user,
                  textInputType: TextInputType.name,
                ),
                myTextFieldWidget(
                  hinText: 'Email',
                  iconData: FontAwesomeIcons.envelope,
                  textInputType: TextInputType.emailAddress,
                ),
                myTextFieldWidget(
                  suffixIcon: Icons.visibility,
                  hinText: 'Password',
                  iconData: FontAwesomeIcons.key,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        checkColor: kBottomBarItemscolor,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                      'By signing up, you agree to the ',
                      style: GoogleFonts.oswald(
                          color: kmonochromcolorwhite, fontSize: 13),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: const Size(0, 0),
                      ),
                      onPressed: () {
                        //do something
                      },
                      child: Text(
                        'Privacy Policy ',
                        style: GoogleFonts.oswald(
                            color: kBottomBarItemscolor, fontSize: 13),
                      ),
                    ),
                    Text(
                      'and ',
                      style: GoogleFonts.oswald(
                          color: kmonochromcolorwhite, fontSize: 13),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: const Size(0, 0),
                      ),
                      onPressed: () {
                        //do something
                      },
                      child: Text(
                        'Terms of Service',
                        style: GoogleFonts.oswald(
                            color: kBottomBarItemscolor, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                myLoginButton(
                  mtext: 'Sign up',
                  onPress: () {
                    Navigator.pushNamed(context, HomeState.id);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Already joined?',
                      style: GoogleFonts.oswald(
                          color: kmonochromcolorwhite, fontSize: 15),
                    ),
                    TextButton(
                      child: Text(
                        'Login',
                        style: GoogleFonts.oswald(
                            color: kBottomBarItemscolor, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                        //do something
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       // navigate directly to onboarding page
        //       final prefs = await SharedPreferences.getInstance();
        //       prefs.setBool('showHome', false);

        //       Navigator.pushNamed(context, OnBoardingScreen.id);
        //     },
        //     icon: Icon(
        //       Icons.logout,
        //       color: kPrimaryColor0,
        //     ),
        //   )