import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/bottomsheet_list_tile.dart';

import '../view/bank_transfer_page.dart';

class BuildSendBottomSheet {
  BuildContext contxt;
  BuildSendBottomSheet({required this.contxt});

  Container _buildContainer(BuildContext context) {
    contxt = context;
    double width = MediaQuery.of(contxt).size.width;
    double height = MediaQuery.of(contxt).size.height;

    return Container(
      height: height * .5,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.35, right: width * 0.35, bottom: 20),
            child: Container(
              color: kmonochromcolor2,
              height: 3,
            ),
          ),
          BottomSheetListTile(
            title: 'Bank transfer',
            subtitle: 'Standard or real-time transfer',
            iconData: Icons.output,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
            onPress: () {
              Navigator.popAndPushNamed(context, BankTransferPage.id);
            },
          ),
          const BottomSheetListTile(
            title: 'Credit/debit card',
            subtitle: 'Transfer funds via bank cards',
            iconData: Icons.credit_card,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          const BottomSheetListTile(
            title: 'Paypal',
            subtitle: 'Transfer funds via paypal',
            iconData: Icons.paypal,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          const BottomSheetListTile(
            title: 'Google pay',
            subtitle: 'Transfer funds via google pay',
            iconData: FontAwesomeIcons.googlePay,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          const BottomSheetListTile(
            title: 'Apple pay',
            subtitle: 'Transfer funds via apple pay',
            iconData: FontAwesomeIcons.applePay,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
        ],
      ),
    );
  }

  Container getBottomSheet() => _buildContainer(contxt);
}
