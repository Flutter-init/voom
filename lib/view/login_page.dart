import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/services/firebase_service.dart';
import 'package:voom/utility/constants.dart';

import '../model/shared_prefs.dart';
import '../model/home_page_model.dart';

import 'registration_page.dart';

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
  bool _isGoogleLoading = false;
  bool _isFacebookLoading = false;
  final FirebaseService _firebaseService = FirebaseService();

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
                const SizedBox(
                  height: 15.0,
                ),
                MyTextFieldWidget(
                  hinText: 'Email',
                  iconData: FontAwesomeIcons.envelope,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailCtrl,
                ),
                MyTextFieldWidget(
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
                  height: 10.0,
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
                      : MyLoginButton(
                          mtext: 'Login',
                          onPress: () {
                            _logUserInWithEmailAndPassword(
                                _emailCtrl.text, _passwordCtrl.text);
                            SharedPreferencesModel.setSharedPreferences(
                                _emailCtrl.text, _passwordCtrl.text);
                          },
                        ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Or',
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: _isGoogleLoading
                      ? const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white)),
                        )
                      : MySocialMediaButton(
                          buttonColor: Colors.white,
                          buttonText: 'Login with Google',
                          icon: FontAwesomeIcons.google,
                          iconColor: Colors.red,
                          textColor: Colors.blueGrey,
                          onPress: () async {
                            setState(() {
                              _isGoogleLoading = true;
                            });

                            try {
                              await _firebaseService.signInWithGoogle();
                              if (!mounted) return;
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HomePageModel.id, (route) => false);
                            } catch (e) {
                              MessageUtils.voomSnackBarMessage(
                                  context, e.toString(), 'Dismiss');
                            }
                          },
                        ),
                ),
                Container(
                  child: _isFacebookLoading
                      ? const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white)),
                        )
                      : MySocialMediaButton(
                          buttonColor: Colors.blue,
                          buttonText: 'Sign up with Facebook',
                          icon: FontAwesomeIcons.facebookF,
                          iconColor: Colors.white,
                          textColor: Colors.white,
                          onPress: () async {
                            setState(() {
                              _isFacebookLoading = true;
                            });

                            FirebaseService service = FirebaseService();
                            try {
                              await service.signInWithFacebook();
                              if (!mounted) return;
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HomePageModel.id, (route) => false);
                            } catch (e) {
                              MessageUtils.voomSnackBarMessage(
                                  context, e.toString(), 'Dismiss');
                            }
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
                        Navigator.popAndPushNamed(context, RegistrationPage.id);
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
                SharedPreferencesModel.setSharedPreferences(
                    _emailCtrl.text, _passwordCtrl.text),
                _passwordCtrl.clear(),
                Navigator.popAndPushNamed(context, HomePageModel.id),
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
}
