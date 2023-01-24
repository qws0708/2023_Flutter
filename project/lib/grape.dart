import 'package:flutter/material.dart';
import 'package:project/survey.dart' as grape;

void main() {
  runApp(Grape());
}

class Grape extends StatelessWidget {
  Grape({super.key});

  var count = grape.grapelist;

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
            child: Text("$count"),
          )),
    );
  }
}
