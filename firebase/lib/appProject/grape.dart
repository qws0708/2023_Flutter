import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/appProject/get_number.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  List<double> papa = [];
  List<_SalesData> data = [
    _SalesData('1', 10),
    _SalesData('2', 28),
    _SalesData('3', 34),
    _SalesData('4', 32),
    _SalesData('5', 40),
    _SalesData('6', 15),
    _SalesData('7', 20),
    _SalesData('8', 25),
    _SalesData('9', 30),
    _SalesData('10', 35),
    _SalesData('11', 20),
    _SalesData('12', 28),
    _SalesData('13', 12),
    _SalesData('14', 45),
    _SalesData('15', 20),
    _SalesData('16', 23),
    _SalesData('17', 13),
    _SalesData('18', 30),
    _SalesData('19', 36),
    _SalesData('20', 47),
  ];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Counter Number').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach(
            (document) {
              //print(document.reference);
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
                      dataSource: data,
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
  final double sales;
}
