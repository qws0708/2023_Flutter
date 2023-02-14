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

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(("Counter Number"));
    for (int i = 0; i < _yValue.length; i++) {
      grapeData.add(_SalesData(_xValue[i], _yValue[i]));
    }
    print("grapeData:");
    print(grapeData);

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
                child: StreamBuilder(
                  stream: users.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            _yValue.add(snapshot.data!.docs[index]['total']);
                            _xValue.add(snapshot.data!.docs[index]['time']);
                            print(_yValue);
                            return ListTile(
                              title: Text(
                                  ' Date : ${snapshot.data!.docs[index]['time']}'),
                              subtitle: Text(
                                  '  Score : ${snapshot.data!.docs[index]['total']}'),
                            );
                          }),
                    );
                  },
                ),
              ),
              Expanded(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Grape Against Record '),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                        dataSource: grapeData,
                        xValueMapper: (_SalesData sales, _) => sales.time,
                        yValueMapper: (_SalesData sales, _) => sales.score,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true))
                  ],
                ),
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
