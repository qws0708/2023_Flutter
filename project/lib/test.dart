import 'package:flutter/material.dart';

void main() => runApp(const ChipApp());

class ChipApp extends StatelessWidget {
  const ChipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const ActionChoiceExample(),
    );
  }
}

class ActionChoiceExample extends StatefulWidget {
  const ActionChoiceExample({super.key});

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 1;
  // ignore: non_constant_identifier_names
  final List<String> _Answer = [
    "Terrible",
    "Bad",
    "Soso",
    "Good",
    "Excellent",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Survey'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Question(question: "하루 동안 당신의 기분은 어떠셨나요?"),
            Answer(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Wrap Answer() {
    return Wrap(
      spacing: 5.0,
      children: List<Widget>.generate(
        5,
        (int index) {
          return ChoiceChip(
            label: Text(
              _Answer[index],
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

class Question extends StatelessWidget {
  final String question;

  const Question({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
