
import 'package:flutter/material.dart';
import 'package:voom/view/chart_page.dart';
import 'package:voom/view/flutter_trans.dart';

import '../view/card_page.dart';
import '../view/complete_reg_page.dart';
import '../view/home_page.dart';
import '../view/bank_transfer_page.dart';
import '../view/login_page.dart';
import '../view/onboarding_page.dart';
import '../view/paystack_trans.dart';
import '../view/profile_page.dart';
import '../view/registration_page.dart';
import '../view/settings_page.dart';
import '../view/spaces_page.dart';
import '../view/success_send_page.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomePage.id: (context) => const HomePage(),
    CardPage.id: (context) => const CardPage(),
    ProfilePage.id: (context) => const ProfilePage(),
    BankTransferPage.id: (context) => BankTransferPage(),
    SpacesPage.id: (context) => const SpacesPage(),
    LoginScreen.id: (context) => const LoginScreen(),
    RegistrationPage.id: (context) => const RegistrationPage(),
    OnboardingPage.id: (context) => OnboardingPage(),
    SuccessSendPage.id: (context) => const SuccessSendPage(),
    SettingsPage.id: (context) => const SettingsPage(),
    CompleteRegistrationPage.id: (context) => const CompleteRegistrationPage(),
    ChartPage.id: (context) => const ChartPage(),
    FlutterTrans.id:(context)=> const FlutterTrans(),
    PaystackTrans.id:(context)=> const PaystackTrans(),
   
  };
}
