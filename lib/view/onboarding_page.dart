import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:voom/view/registration_page.dart';
import 'package:voom/utility/constants.dart';

class OnboardingPage extends StatefulWidget {
  static String id = '/onboard';
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  void _onIntroEnd(context) {
    Navigator.pushNamedAndRemoveUntil(
        context, RegistrationPage.id, (route) => false);
  }

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle =
        GoogleFonts.poppins(fontSize: 20, color: kmonochromcolor2);

    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 28,
          color: kmonochromcolorwhite,
          fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: kInactiveCardColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: kActiveCardColor,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: kBottomBarItemscolor),
          child: Text(
            'Let\'s go right away!',
            style:
                GoogleFonts.poppins(color: kmonochromcolorBlack, fontSize: 18),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Get loan for your business",
          body:
              "Receive a good debt for your projects with negligible interest rates. Have a good credit score and increase your loan amount.",
          image: _buildImage('loan.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Invest as you go",
          body:
              "Let your money make more money for you. With the help of experts or all by yourself.",
          image: _buildImage('invest.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Save up",
          body:
              "Don't let unforseen periods overwhelm you. A buffer for such situations is tailored up for you.",
          image: _buildImage('save.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        FontAwesomeIcons.circleArrowLeft,
        color: kmonochromcolorwhite,
      ),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(
        FontAwesomeIcons.circleArrowRight,
        color: kmonochromcolorwhite,
      ),
      done: Text(
        'Done',
        style: GoogleFonts.poppins(color: kmonochromcolorwhite, fontSize: 16),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: kActiveCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
