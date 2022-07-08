import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

import 'listTileNoIcon.dart';

class BuildRequestBottomSheet {
  BuildContext contxt;
  BuildRequestBottomSheet({required this.contxt});

  Container _buildContainer(BuildContext context) {
    contxt = context;
    double height = MediaQuery.of(contxt).size.height;
    return Container(
      height: height * .7,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'USD account details',
              style: GoogleFonts.poppins(
                  color: kmonochromcolorBlack, fontSize: 18),
            ),
            subtitle: Text(
              'US dollar',
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
                    image: AssetImage('images/boy.png'),
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
          ListTileNoIcon(
            title: 'Account holder',
            subtitle: 'Barbara Scott',
          ),
          ListTileNoIcon(
            title: 'ACH routing number',
            subtitle: '024444543',
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help,
                color: kSendFABcolor,
              ),
            ),
          ),
          ListTileNoIcon(
            title: 'Wire routing number',
            subtitle: '020004543',
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help,
                color: kSendFABcolor,
              ),
            ),
          ),
          const ListTileNoIcon(
            title: 'Account number',
            subtitle: '8300000187',
          ),
          const ListTileNoIcon(
            title: 'Account type',
            subtitle: 'Checking',
          ),
          ListTileNoIcon(
            title: 'Voom\'s address',
            subtitle: '260 5th Ave\nNew York City, NY 10001\nUnited States',
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help,
                color: kSendFABcolor,
              ),
            ),
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
          ),
        ],
      ),
    );
  }

  Container getBottomSheet() => _buildContainer(contxt);
}
