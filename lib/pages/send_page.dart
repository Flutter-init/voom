import 'package:flutter/material.dart';
import 'package:voom/utility/constants.dart';

class SendPage extends StatelessWidget {
  static String id = '/sendPage';
  const SendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Column(
        children: [],
      ),
      Column(
        children: [],
      ),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'Local transfer'),
      const Tab(
        text: 'International transfer',
      ),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        backgroundColor: kActiveCardColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 15,
          backgroundColor: kInactiveCardColor,
          bottom: TabBar(
            indicatorColor: kSendFABcolor,
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
