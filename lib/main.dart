import 'package:flutter/material.dart';
import 'package:voom/pages/card_page.dart';
import 'package:voom/pages/homeScreen.dart';
import 'package:voom/pages/home_state.dart';
import 'package:voom/pages/local_transfer.dart';
import 'package:voom/pages/login_screen.dart';
import 'package:voom/pages/onboarding_page.dart';
import 'package:voom/pages/profile.dart';
import 'package:voom/pages/registration_screen.dart';

import 'package:voom/pages/spaces_page.dart';
import 'package:voom/pages/success_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voom',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: HomeState.id,
      routes: {
        HomeState.id: (context) => const HomeState(),
        HomeScreen.id: (context) => const HomeScreen(),
        CardPage.id: (context) => const CardPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        LocalTransferPage.id:(context) => LocalTransferPage(),
        SpacesPage.id: (context) => const SpacesPage(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        OnboardingPage.id: (context) => OnboardingPage(),
        SuccessSendPage.id:(context) => const SuccessSendPage(),
      },
    );
  }
}
