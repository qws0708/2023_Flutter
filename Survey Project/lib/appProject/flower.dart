import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Flower());
}

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  State<Flower> createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  CollectionReference users =
      FirebaseFirestore.instance.collection(("Counter Number"));

  final List<int> _allTotalValue = [];

  int medium = 0;
  int total = 0;
  int length = 0;
  String flowerName = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flower"),
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
                height: 600,
                child: StreamBuilder(
                  stream: users.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    } else {
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        _allTotalValue.add(snapshot.data!.docs[i]['total']);
                      }
                      int total = _allTotalValue.fold(0, (value, element) {
                        return value + element;
                      }); // 리스트 값 모두 더하기
                      length = snapshot.data!.docs.length; //리스트 개수
                      medium = (total / length).ceil(); //나눠서 반올림
                      //print(total);
                      //print(length);
                      print(medium);
                      if (medium > 0 && medium < 4) {
                        flowerName = "Bad";
                      }
                      if (medium >= 4 && medium < 8) {
                        flowerName = "Soso";
                      }
                      if (medium >= 8 && medium < 12) {
                        flowerName = "Happy";
                      }
                      if (medium >= 12 && medium < 16) {
                        flowerName = "Exellent";
                      }
                    }

                    return SingleChildScrollView(
                      child: Column(children: [
                        Image.asset('image/$flowerName.png'),
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Image.asset('image/Happy.png')
