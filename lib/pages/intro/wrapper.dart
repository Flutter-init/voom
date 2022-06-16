import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/pages/home_state.dart';
import 'package:voom/pages/login_screen.dart';
import 'package:voom/pages/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/shared_prefs.dart';
import '../homeScreen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _isLoggedIn = false;
  bool _isLoggedInBefore = false;

  @override
  void initState() {
    super.initState();
    // startTimer();
    checkUserLoggedIn();
    checkIfFirstTimer();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      return const HomeState();
    } else {
      if (_isLoggedInBefore == true) {
        return const LoginScreen();
      } else {
        return OnboardingPage();
      }
    }
  }

  checkUserLoggedIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(SharedPreferencesKeys.email.toString())) {
      _isLoggedIn = true;
      return _isLoggedIn;
    } else {
      _isLoggedIn = false;
      return _isLoggedIn;
    }
  }

  checkIfFirstTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isLoggedIn == false) {
      if (prefs.containsKey(SharedPreferencesKeys.email.toString())) {
        _isLoggedInBefore = prefs.getBool('loggedInBefore')!;
        return _isLoggedInBefore;
      }
    }
  }
}