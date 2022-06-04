import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

import 'home_state.dart';

import 'registration_screen.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/social_media_button.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            // child: ConstrainedBox(
            //   constraints: BoxConstraints(),
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
                    'LOG IN',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.oswald(
                        color: kmonochromcolorwhite, fontSize: 20),
                  ),
                ),
                SizedBox(
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
                const SizedBox(
                  height: 30.0,
                ),
                myLoginButton(
                  mtext: 'Login',
                  onPress: () {
                    Navigator.pushNamed(context, HomeState.id);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Don\'t have an account yet?',
                      style: GoogleFonts.oswald(
                          color: kmonochromcolorwhite, fontSize: 15),
                    ),
                    TextButton(
                      child: Text(
                        'Join',
                        style: GoogleFonts.oswald(
                            color: kBottomBarItemscolor, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                        //do something
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: TextButton(
                    onPressed: () {
                      // do somwthing
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.oswald(
                          color: kBottomBarItemscolor, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
