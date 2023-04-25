import 'package:flutter/material.dart';

// api keys
const String kPayStackPublicKeyAPI =
    'pk_test_7a51da3d5b59de9b3fa0ebffc7bd75defb837203';
const String kFlutterwavePublicKeyAPI =
    'FLWPUBK_TEST-748dea6cf0066f05552d7998572c18d3-X';
const String kFlutterwaveEnkrypKeyAPI = 'FLWSECK_TEST6b8a6e9cd15e';
const String kHerokuCallback = 'https://berncovoom.herokuapp.com/';

// monochromatic color palette
const kmonochromcolor1 = Color(0xffe6e6e6);
const kmonochromcolor2 = Color(0xff979797);
const kmonochromcolor3 = Color(0xff646464);
const kmonochromcolor4 = Color(0xff414141);
const kmonochromcolorBlack = Color(0xff000000);
const kmonochromcolorwhite = Color(0xffffffff);

// define constants
const kBottomContainerBorderRadius = Radius.elliptical(35.0, 30.0);
const kActiveCardColor = Color(0xff1d1e33);
const kInactiveCardColor = Color(0xff111328);
const kAppBarBackgroundColor = Color(0xFF1D2136);
const kSendFABcolor = Color.fromARGB(255, 27, 124, 6);
const kBottomBarItemscolor = Color.fromARGB(255, 103, 245, 71);

const kContainerDeco = BoxDecoration(
  color: kActiveCardColor,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15), topRight: Radius.circular(15)),
);
