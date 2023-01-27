import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

var a;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
          child: ElevatedButton(onPressed: readData, child: Text("data"))),
    );
  }
}

void readData() {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("FirestoreDemo") //colleection 이름
      .doc('aSrMicViLUAtnCXB5w6k'); //문서 ID
  userCollectionReference.get().then((value) => print(value.data()));
}
