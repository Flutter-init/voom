import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';
import 'package:voom/widgets/bottomSheet_listTile.dart';

import '../pages/local_transfer.dart';

class BuildSendBottomSheet {
  BuildContext contxt;
  BuildSendBottomSheet({required this.contxt});

  Container _buildContainer(BuildContext context) {
    contxt = context;
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          BottomSheetListTile(
            title: 'Transfer',
            subtitle: 'Standard, scheduled or real-time transfer',
            iconData: Icons.output,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
            onPress: () {
              Navigator.popAndPushNamed(context, LocalTransferPage.id);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: kmonochromcolorBlack,
            ),
          ),
          BottomSheetListTile(
            title: 'Standing orders',
            subtitle: 'Carryout the same transfer on a periodic basis',
            iconData: Icons.pending_actions,
            avaColor: kActiveCardColor,
            iconColor: kmonochromcolorwhite,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: kmonochromcolorBlack,
            ),
          ),
        ],
      ),
    );
  }

  Container getBottomSheet() => _buildContainer(contxt);
}
