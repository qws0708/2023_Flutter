import 'package:flutter/material.dart';

void main() {
  runApp(const Survey());
}

class Survey extends StatelessWidget {
  const Survey({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "1. 오늘 당신의 기분은 어떠셨나요?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "NewFont",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [],
            ),
          ],
        ),
      ),
    );
  }
}
