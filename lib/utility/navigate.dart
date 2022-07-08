import 'package:flutter/material.dart';
import 'package:voom/view/chart_page.dart';
import '../model/card_page.dart';
import '../view/complete_reg_page.dart';
import '../view/home_page.dart';
import '../view/bank_transfer_page.dart';
import '../view/login_page.dart';
import '../view/onboarding_page.dart';
import '../view/profile_page.dart';
import '../view/registration_page.dart';
import '../view/settings_page.dart';
import '../view/spaces_page.dart';
import '../view/success_page.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.id: (context) => const HomeScreen(),
        CardPage.id: (context) => const CardPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        LocalTransferPage.id: (context) => LocalTransferPage(),
        SpacesPage.id: (context) => const SpacesPage(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        OnboardingPage.id: (context) => OnboardingPage(),
        SuccessSendPage.id: (context) => const SuccessSendPage(),
        SettingsPage.id:(context) => const SettingsPage(),
        CompleteRegistration.id:(context) => const CompleteRegistration(),
        ChartPage.id:(context)=>const ChartPage(),
  };
}
