import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/pages/success_page.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/myListTileCard.dart';
import 'package:voom/widgets/text_field_widget.dart';

class LocalTransferPage extends StatefulWidget {
  static String id = '/local';
  LocalTransferPage({Key? key}) : super(key: key);

  @override
  State<LocalTransferPage> createState() => _LocalTransferPageState();
}

class _LocalTransferPageState extends State<LocalTransferPage> {
  bool _isRTSwitchOn = false;
  bool _isTemplateSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8),
        child: SizedBox(
          width: width * 0.9,
          child: FloatingActionButton.extended(
            backgroundColor: kSendFABcolor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, SuccessSendPage.id);
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Send",
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 18),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    FontAwesomeIcons.paperPlane,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kInactiveCardColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Bank transfer',
          style: GoogleFonts.poppins(color: kmonochromcolorwhite, fontSize: 18),
        ),
      ),
      backgroundColor: kInactiveCardColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Origin account',
              style:
                  GoogleFonts.poppins(fontSize: 18, color: kmonochromcolorwhite),
            ),
          ),
          const MyListTileCard(
            header: 'Financial Overview',
            text: 'Voom savings account',
            avatarChild: Image(
              image: AssetImage('images/logo.png'),
            ),
            subText: 'BE 2546 2321 3447\nDon Scotus',
            trailing: "\$3000.00",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: kmonochromcolorwhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              'Beneficiary',
              style:
                  GoogleFonts.poppins(fontSize: 18, color: kmonochromcolorwhite),
            ),
          ),
          myTextFieldWidget(
              hinText: "Recipient's name",
              iconData: Icons.settings_accessibility,
              textInputType: TextInputType.name),
          myTextFieldWidget(
              hinText: 'IBAN',
              iconData: Icons.pin,
              textInputType: TextInputType.name),
          myTextFieldWidget(
              hinText: 'Amount',
              iconData: Icons.redeem,
              textInputType: TextInputType.number),
          myTextFieldWidget(
              hinText: 'Reference',
              iconData: Icons.keyboard,
              textInputType: TextInputType.text),
          myTextFieldWidget(
              hinText: "Recipient's email",
              iconData: Icons.email,
              textInputType: TextInputType.emailAddress),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: kmonochromcolorwhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              'Execution',
              style: GoogleFonts.poppins(fontSize: 18, color: kmonochromcolor2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Real-time transfer',
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: kmonochromcolorwhite),
                ),
                Switch(
                    activeColor: kSendFABcolor,
                    inactiveThumbColor: kmonochromcolor2,
                    value: _isRTSwitchOn,
                    onChanged: (bool value) {
                      setState(() {
                        _isRTSwitchOn = value;
                      });
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save as template',
                  style: GoogleFonts.oswald(
                      fontSize: 16, color: kmonochromcolorwhite),
                ),
                Switch(
                    activeColor: kSendFABcolor,
                    inactiveThumbColor: kmonochromcolor2,
                    value: _isTemplateSwitchOn,
                    onChanged: (bool value) {
                      setState(() {
                        _isTemplateSwitchOn = value;
                      });
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
