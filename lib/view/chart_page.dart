import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utility/constants.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);
  static String id = '/chartPage';

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Activity Chart"),
        backgroundColor: kInactiveCardColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              child: SfCartesianChart(
                  crosshairBehavior: CrosshairBehavior(enable: true),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        // Bind data source
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  String? year;
  int? sales;
  SalesData(this.year, this.sales);
}
