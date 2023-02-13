import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'get_number.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Grape());
}

// ignore: must_be_immutable

class Grape extends StatefulWidget {
  const Grape({super.key});

  @override
  State<Grape> createState() => _GrapeState();
}

class _GrapeState extends State<Grape> {
  List<String> docIDs = [];
  List<int> total = [];
  List<_SalesData> grapedata = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Counter Number').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Grape"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      child: ListView.builder(
                        itemCount: docIDs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: GetNumber(
                            documentId: docIDs[index],
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Half yearly sales analysis'),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: grapedata,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
