import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/bottomSheet_listTile.dart';

import '../pages/local_transfer.dart';

class BuildRequestBottomSheet {
  BuildContext contxt;
  BuildRequestBottomSheet({required this.contxt});

  Container _buildContainer(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    contxt = context;
    return Container(
      height: height * 0.7,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Account details',
              style:
                  GoogleFonts.poppins(color: kmonochromcolorBlack, fontSize: 18),
            ),
            subtitle: Text(
              'United states dollar',
              style: GoogleFonts.poppins(color: kmonochromcolor2, fontSize: 16),
            ),
            leading: CircleAvatar(
              backgroundColor: kSendFABcolor,
              radius: 27,
              child: CircleAvatar(
                backgroundColor: kmonochromcolorwhite,
                radius: 25,
                child: ClipOval(
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: Text(
                'Share',
                style: GoogleFonts.poppins(color: kSendFABcolor, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: kmonochromcolorBlack,
            ),
          ),
          BottomSheetListTile(
            title: 'Account holder',
            subtitle: 'Don Scotus',
            iconData: FontAwesomeIcons.userAstronaut,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          BottomSheetListTile(
            title: 'BIC',
            subtitle: 'VMBSBEB2XXX',
            iconData: FontAwesomeIcons.barcode,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          BottomSheetListTile(
            title: 'IBAN',
            subtitle: 'BE 2546 2321 3447',
            iconData: FontAwesomeIcons.buildingColumns,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          BottomSheetListTile(
            title: 'Voom\'s address',
            subtitle: 'Rank One 14\n2142\nBernco Subspace 1\nBencoSpace',
            iconData: FontAwesomeIcons.mapPin,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 50,
              color: kSendFABcolor,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'Copy your details',
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Container getBottomSheet() => _buildContainer(contxt);
}
