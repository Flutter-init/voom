import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voom/pages/card_page.dart';
import 'package:voom/pages/homeScreen.dart';
import 'package:voom/pages/home_state.dart';
import 'package:voom/pages/intro/wrapper.dart';
import 'package:voom/pages/local_transfer.dart';
import 'package:voom/pages/login_screen.dart';
import 'package:voom/pages/onboarding_page.dart';
import 'package:voom/pages/profile.dart';
import 'package:voom/pages/registration_screen.dart';
import 'package:voom/pages/settingsPage.dart';

import 'package:voom/pages/spaces_page.dart';
import 'package:voom/pages/success_page.dart';


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const Wrapper(),
      // initialRoute: HomeState.id,
      routes: {
        // HomeState.id: (context) => const HomeState(),
        HomeScreen.id: (context) => const HomeScreen(),
        CardPage.id: (context) => const CardPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        LocalTransferPage.id: (context) => LocalTransferPage(),
        SpacesPage.id: (context) => const SpacesPage(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        OnboardingPage.id: (context) => OnboardingPage(),
        SuccessSendPage.id: (context) => const SuccessSendPage(),


        SettingsPage.id:(context) => SettingsPage(),

      },
    );
  }
}
