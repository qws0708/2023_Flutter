import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
  FirebaseFirestore db = FirebaseFirestore.instance;
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
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("DownLoad Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
