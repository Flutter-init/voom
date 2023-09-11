import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/model/firestore_constants.dart';
import 'package:voom/utility/message_utils.dart';

import '../model/shared_prefs.dart';
import '../model/home_page_model.dart';
import '../services/firebase_service.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/social_media_button.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/login_button.dart';

class RegistrationPage extends StatefulWidget {
  // variable for navigating to this screen
  static const String id = '/registration';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late bool isChecked = false;
  bool _showPassword = true;

  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool _signingUp = false;

  final FirebaseService _firebaseService = FirebaseService();
  bool _isGoogleLoading = false;
  bool _isFacebookLoading = false;

  final _firestoreUser = FirebaseFirestore.instance;

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
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: kmonochromcolorwhite, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                MyTextFieldWidget(
                  hinText: 'Full name',
                  iconData: FontAwesomeIcons.user,
                  textInputType: TextInputType.name,
                  controller: _fullNameCtrl,
                ),
                MyTextFieldWidget(
                  hinText: 'Email address',
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
                  controller: _passwordCtrl,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: _signingUp
                      ? const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white)),
                        )
                      : MyLoginButton(
                          mtext: 'Sign up',
                          onPress: () {
                            if (isChecked == false ||
                                _fullNameCtrl.text == '' ||
                                _emailCtrl.text == '' ||
                                _passwordCtrl.text == '') {
                              MessageUtils.voomSnackBarMessage(context,
                                  'Please all field are required', 'OK');
                            } else {
                              _signUpWithEmailAndPassword(
                                  _emailCtrl.text, _passwordCtrl.text);
                            }
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
                  height: 10.0,
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
                          buttonText: 'Sign up with Google',
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
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 10),
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
                        style: GoogleFonts.poppins(
                            color: kBottomBarItemscolor, fontSize: 10),
                      ),
                    ),
                    Text(
                      'and ',
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 10),
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
                        style: GoogleFonts.poppins(
                            color: kBottomBarItemscolor, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Already joined?',
                      style: GoogleFonts.poppins(
                          color: kmonochromcolorwhite, fontSize: 15),
                    ),
                    TextButton(
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            color: kBottomBarItemscolor, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, LoginScreen.id);
                        //do something
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      setState(() => _signingUp = true);
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                SharedPreferencesModel.setSharedPreferences(
                    _emailCtrl.text, _passwordCtrl.text),
                _addUserToFireStore()
              })
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {
        MessageUtils.voomSnackBarMessage(context, e!.message, 'Dismiss');
      });
    } finally {
      setState(() => _signingUp = false);
    }
  }

  Future<void> _addUserToFireStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return _firestoreUser.collection('Users').doc(_fullNameCtrl.text).set({
      FireStoreConstants.fullName: _fullNameCtrl.text,
      FireStoreConstants.emailAddress: _emailCtrl.text,
      FireStoreConstants.password: _passwordCtrl.text,
    }).then((value) {
      if (kDebugMode) {
        print('User Added to firestore db with Name: ${_fullNameCtrl.text}');
      }
      prefs.setString(SharedPreferencesModel.documentId,
          '${_fullNameCtrl.text}: ${_auth.currentUser?.uid}');
      _emailCtrl.clear();
      _passwordCtrl.clear();
      _fullNameCtrl.clear();
      Navigator.popAndPushNamed(context, HomePageModel.id);
    }).catchError((onError) {
      if (kDebugMode) {
        print('addition failed: onError $onError');
      }
    });
  }
}
