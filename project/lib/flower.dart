import 'package:flutter/material.dart';
import 'package:project/survey.dart' as image;

void main() {
  runApp(Flower());
}

// ignore: must_be_immutable
class Flower extends StatelessWidget {
  Flower({super.key});

  int count = image.grapecount;

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
          child: count >= 0 && count < 6
              ? Image.asset("assets/images/sad flower.png")
              : count >= 6 && count < 11
                  ? Image.asset("assets/images/normal flower.png")
                  : Image.asset("assets/images/happy flower.png"),
        ),
      ),
    );
  }
}

//Image.asset("assets/images/sad flower.png");