import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/my_card.dart';
import '../widgets/m_list_tile.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardPage extends StatefulWidget {
  static String id = '/cardpage';
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CreditCardWidget(
                isHolderNameVisible: true,
                cardBgColor: kBottomBarItemscolor,
                cardType: CardType.mastercard,
                cardNumber: '1200 5445 8598 0034',
                obscureCardNumber: false,
                expiryDate: '11/22',
                cardHolderName: 'Don Scotus',
                cvvCode: '234',
                showBackView: false,

                onCreditCardWidgetChange:
                    (CreditCardModel) {}, //true when you want to show cvv(back) view
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Manage card',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: kmonochromcolor2, fontSize: 16),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: kmonochromcolorwhite,
                    ),
                  ),
                  MListTile(
                    iconData: Icons.settings,
                    text: 'Manage payment methods',
                    onPress: () {
                      //do something
                    },
                  ),
                  MListTile(
                    iconData: Icons.password,
                    text: 'Show PIN',
                    onPress: () {
                      //do something
                    },
                  ),
                  MListTile(
                    iconData: Icons.visibility,
                    text: 'Card details',
                    onPress: () {
                      //do something
                    },
                  ),
                  MListTile(
                    iconData: Icons.ac_unit,
                    text: 'Freeze card',
                    onPress: () {
                      //do something
                    },
                  ),
                  MListTile(
                    iconData: Icons.lock_open,
                    text: 'Unblock PIN',
                    onPress: () {
                      //do something
                    },
                  ),
                  MListTile(
                    iconData: Icons.recycling,
                    text: 'Replace card',
                    onPress: () {
                      //do something
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////%%%%%%%%%%%%%%%%%%%%%%%//
