import 'package:cloud_firestore/cloud_firestore.dart';
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
  final List<int> _yValue = []; //그래프 y축 값
  final List<String> _xValue = []; //그래프 x축 값

  List<_SalesData> grapeData = [];

  Future wait() async {
    await Future.delayed(const Duration(seconds: 1));
    return grapeData;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(("Counter Number"));

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
            children: [
              SizedBox(
                height: 300,
                child: StreamBuilder(
                  stream: users.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          _yValue.add(snapshot.data!.docs[index]['total']);
                          _xValue.add(snapshot.data!.docs[index]['time']);
                          grapeData
                              .add(_SalesData(_xValue[index], _yValue[index]));

                          return ListTile(
                            title: Text(
                                ' Date : ${snapshot.data!.docs[index]['time']}'),
                            subtitle: Text(
                                '  Score : ${snapshot.data!.docs[index]['total']}'),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 300,
                child: FutureBuilder(
                    future: wait(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) {
                        return const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      }
                      return SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(text: 'Fucking Grape'),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<_SalesData, String>>[
                          LineSeries<_SalesData, String>(
                              dataSource: grapeData,
                              xValueMapper: (_SalesData sales, _) => sales.time,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.score,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.time, this.score);

  final String time;
  final int score;
}
