import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
        home: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ElevatedButton(
                onPressed: readData,
                child: Text("read data"),
              ),
              ElevatedButton(
                onPressed: addData,
                child: Text("send data"),
              ),
              ElevatedButton(
                onPressed: updateData,
                child: Text("update data"),
              ),
              ElevatedButton(
                onPressed: deleteAllData,
                child: Text("delete data"),
              ),
              ElevatedButton(
                onPressed: deletePartData,
                child: Text("delete Part data"),
              ),
            ],
          ),
        ));
  }
}

void readData() {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("FirestoreDemo") //colleection 이름
      .doc('aSrMicViLUAtnCXB5w6k'); //문서 ID
  userCollectionReference.get().then((value) => print(value.data()));
}

void addData() {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("FirestoreDemo") //colleection 이름
      .doc('userkey1'); //문서 ID
  userCollectionReference.set({"name:": '안성우', 'age:': 25});
}

void updateData() {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("FirestoreDemo") //colleection 이름
      .doc('userkey1'); //문서 ID
  userCollectionReference.update({'age:': 13});
}

void deleteAllData() {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("FirestoreDemo") //colleection 이름
      .doc('userkey1'); //문서 ID
  userCollectionReference.delete();
}

void deletePartData() {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("FirestoreDemo") //colleection 이름
      .doc('userkey1'); //문서 ID
  userCollectionReference.update({'age:': FieldValue.delete()});
}
