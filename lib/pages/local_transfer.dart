import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/pages/success_page.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/myListTileCard.dart';
import 'package:voom/widgets/text_field_widget.dart';

import '../widgets/textFieldNoIcon.dart';

class LocalTransferPage extends StatefulWidget {
  static String id = '/local';
  LocalTransferPage({Key? key}) : super(key: key);

  @override
  State<LocalTransferPage> createState() => _LocalTransferPageState();
}

class _LocalTransferPageState extends State<LocalTransferPage> {
  static const menuItems = <String>[
    'Savings',
    'Checking',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  String? _selectedVal;
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
              style: GoogleFonts.poppins(
                  fontSize: 18, color: kmonochromcolorwhite),
            ),
          ),
          const MyListTileCard(
            header: 'Financial Overview',
            text: 'Voom savings account',
            avatarChild: Image(
              image: AssetImage('images/logo.png'),
            ),
            subText: '8300000187\nBarbara Scott',
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
              style: GoogleFonts.poppins(fontSize: 18, color: kmonochromcolor2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFieldNoIcon(
              hintext: "Recipient's full name",
              textInputType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFieldNoIcon(
              hintext: "ACH routing number",
              textInputType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFieldNoIcon(
              hintext: "Account number",
              textInputType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: kmonochromcolor2),
                color: kInactiveCardColor,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: ListTile(
                title: Text(
                  'Account type',
                  style: GoogleFonts.poppins(color: kmonochromcolorwhite),
                ),
                trailing: DropdownButton(
                  dropdownColor: kAppBarBackgroundColor,
                  style: GoogleFonts.poppins(
                      color: kmonochromcolorwhite, fontSize: 16),
                  value: _selectedVal,
                  hint: Text(
                    'Choose',
                    style: GoogleFonts.poppins(color: kmonochromcolorwhite),
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() => _selectedVal = newValue);
                    }
                  },
                  items: _dropDownMenuItems,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFieldNoIcon(
              hintext: "Amount",
              textInputType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFieldNoIcon(
              hintext: "Reference",
              textInputType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFieldNoIcon(
              hintext: "Recipient's email address",
              textInputType: TextInputType.emailAddress,
            ),
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
                  style: GoogleFonts.poppins(
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
          ),
        ],
      ),
    );
  }
}
