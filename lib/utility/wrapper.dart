import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/model/home_page_model.dart';
import 'package:voom/view/login_page.dart';
import 'package:voom/view/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/shared_prefs.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // ignore: prefer_final_fields
  bool _isLoggedIn = false;
  bool _isLoggedInBefore = true;

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
    checkIfFirstTimer(_isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      _isLoggedIn = true;
      return const HomePageModel();
    } else {
      return FutureBuilder<bool>(
          future: checkIfFirstTimer(_isLoggedIn),
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              if (kDebugMode) {
                print('inside login check ${snapshot.data}');
              }
              return const LoginScreen();
            } else {
              if (kDebugMode) {
                print('inside onboarding check ${snapshot.data}');
              }
              return const OnboardingPage();
            }
          });
    }
  }

  checkUserLoggedIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(
          'has the email key ${prefs.containsKey(SharedPreferencesModel.email.toString())}');
    }
    return _isLoggedIn =
        prefs.containsKey(SharedPreferencesModel.email.toString());
  }

  Future<bool> checkIfFirstTimer(bool loginStatus) async {
    if (loginStatus == false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(SharedPreferencesModel.password.toString())) {
        _isLoggedInBefore =
            prefs.getBool(SharedPreferencesModel.loginStatus.toString()) ??
                false;
        if (kDebugMode) {
          print(
              'logged in before? $_isLoggedInBefore + logged in? $_isLoggedIn');
        }
        return _isLoggedInBefore;
      }
    }
    throw Exception('There was an error');
  }
}
