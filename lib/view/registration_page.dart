import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/message_utils.dart';

import '../model/shared_prefs.dart';
import '../model/home_page_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // final _phoneNumberCtrl = TextEditingController();
  // final _dobCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool _signingUp = false;

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
                // myTextFieldWidget(
                //   hinText: 'Phone number',
                //   iconData: Icons.phone,
                //   textInputType: TextInputType.phone,
                //   controller: _phoneNumberCtrl,
                // ),
                // myTextFieldWidget(
                //   hinText: 'Date of birth',
                //   iconData: FontAwesomeIcons.cakeCandles,
                //   textInputType: TextInputType.number,
                //   controller: _dobCtrl,
                // ),
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
                                // _phoneNumberCtrl.text == '' ||
                                // _dobCtrl.text == '' ||
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

                MySocialMediaButton(
                  buttonColor: Colors.white,
                  buttonText: 'Sign up with Google',
                  icon: FontAwesomeIcons.google,
                  iconColor: Colors.red,
                  textColor: Colors.blueGrey,
                  onPress: () {},
                ),
                MySocialMediaButton(
                  buttonColor: Colors.blue,
                  buttonText: 'Sign up with Facebook',
                  icon: FontAwesomeIcons.facebookF,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  onPress: () {},
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
                setSharedPreferences(
                  _fullNameCtrl.text,
                  _emailCtrl.text,
                ),
                _emailCtrl.clear(),
                _passwordCtrl.clear(),
                // _phoneNumberCtrl.clear(),
                // _dobCtrl.clear(),
                _fullNameCtrl.clear(),
                Navigator.popAndPushNamed(context, HomePageModel.id),
              })
          .catchError((e) {
        MessageUtils.voomSnackBarMessage(context, e!.message, 'Dismiss');
      });
    } finally {
      setState(() => _signingUp = false);
    }
  }

  setSharedPreferences(String fullName, String emailAddress) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        SharedPreferencesKeys.fullName.toString(), fullName.toString());
    prefs.setString(
        SharedPreferencesKeys.email.toString(), emailAddress.toString());
    // prefs.setString(
    //     SharedPreferencesKeys.phone.toString(), phoneNumber.toString());
    // prefs.setString(SharedPreferencesKeys.dob.toString(), dob.toString());
  }
}
