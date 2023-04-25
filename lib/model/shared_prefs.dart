import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesModel {
  static String? dob = 'dob';
  static String? fullName = 'full_name';
  static String? email = 'email';
  static String? phone = 'phone';
  static String? password = 'password';
  static String? loginStatus = 'loggedInBefore';
  static String? seenOnboarding = 'seenOnBoarding';
  static String documentId = 'documentId';

  static bool _isLoggedInBefore = true;

  static setSharedPreferences(String emailAddress, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        SharedPreferencesModel.email.toString(), emailAddress.toString());
    await prefs.setString(SharedPreferencesModel.password.toString(), password);
    await prefs.setBool(SharedPreferencesModel.loginStatus.toString(), true);
  }

  static checkIfLoggedInBefore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedInBefore =
        prefs.getBool(SharedPreferencesModel.loginStatus.toString()) ?? true;
    _isLoggedInBefore ? _isLoggedInBefore : !_isLoggedInBefore;
  }

  static setSharedPrefsForGoogleAndFacebookSignup(
      String emailAddress, String fullName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        SharedPreferencesModel.email.toString(), emailAddress.toString());
    await prefs.setString(SharedPreferencesModel.fullName.toString(), fullName);
    await prefs.setBool(SharedPreferencesModel.loginStatus.toString(), true);
  }
}
