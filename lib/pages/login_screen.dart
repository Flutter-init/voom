import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/utility/constants.dart';

import '../model/shared_prefs.dart';
import 'home_state.dart';

import 'registration_screen.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/social_media_button.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/login_button.dart';
import 'package:voom/utility/message_utils.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;

  final _auth = FirebaseAuth.instance;
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _logingIn = false;

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
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'LOG IN',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                myTextFieldWidget(
                  hinText: 'Email',
                  iconData: FontAwesomeIcons.envelope,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailCtrl,
                ),
                myTextFieldWidget(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: kmonochromcolor2,
                      ),
                    ),
                    hinText: 'Password',
                    iconData: FontAwesomeIcons.key,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: _showPassword,
                    controller: _passwordCtrl),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: _logingIn
                      ? const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white)),
                        )
                      : myLoginButton(
                          mtext: 'Login',
                          onPress: () {
                            _logUserInWithEmailAndPassword(
                                _emailCtrl.text, _passwordCtrl.text);
                          },
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Don\'t have an account yet?',
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 15),
                    ),
                    TextButton(
                      child: Text(
                        'Join',
                        style: GoogleFonts.poppins(
                            color: kBottomBarItemscolor, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, RegistrationScreen.id);
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
                      style: GoogleFonts.poppins(
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

  Future<void> _logUserInWithEmailAndPassword(
      String email, String password) async {
    try {
      setState(() => _logingIn = true);
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                setSharedPreferences(_emailCtrl.text, _passwordCtrl.text),
                _emailCtrl.clear(),
                _passwordCtrl.clear(),
                Navigator.popAndPushNamed(context, HomeState.id),
              })
          .catchError((e) {
        // Fluttertoast.showToast(msg: e!.message);
        MessageUtils.voomSnackBarMessage(
            context, "Please complete all required inputs", 'Dismiss');
      });
    } finally {
      setState(() => _logingIn = false);
    }
  }

  setSharedPreferences(String emailAddress, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        SharedPreferencesKeys.email.toString(), emailAddress.toString());
  }
}
