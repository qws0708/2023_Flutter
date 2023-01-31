import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void readData() {
    setState(() {
      counter;
    });
    //print(counter);
    for (int i = 1; i < counter + 1; i++) {
      final userCollectionReference = FirebaseFirestore.instance
          .collection("Count Number") //colleection 이름
          .doc('$i'); //문서 ID
      userCollectionReference.get().then((value) => print(value.data()));
    }
  }

  void addData() {
    setState(() {
      counter++;
    });

    //print(counter);
    final userCollectionReference = FirebaseFirestore.instance
        .collection("Count Number") //colleection 이름
        .doc('$counter'); //문서 ID
    userCollectionReference.set({"number:": counter});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: readData,
                child: const Text("read data"),
              ),
              ElevatedButton(
                onPressed: addData,
                child: const Text("add data"),
              ),
            ],
          ),
        ));
  }
}
