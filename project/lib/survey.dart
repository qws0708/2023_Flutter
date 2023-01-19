// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

void main() {
  runApp(const Survey());
}

enum ASW { Terrible, Bad, Soso, Good, Excellent }

enum ASW2 { Terrible, Bad, Soso, Good, Excellent }

enum ASW3 { Terrible, Bad, Soso, Good, Excellent }

enum ASW4 { Terrible, Bad, Soso, Good, Excellent }

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  ASW? _character = ASW.Terrible;
  ASW2? _character2 = ASW2.Terrible;
  ASW3? _character3 = ASW3.Terrible;
  ASW4? _character4 = ASW4.Terrible;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Daily Survey"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "1.  오늘 당신의 기분은 어떠셨나요?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "NewFont",
                  ),
                ),
                Answer('Terrible', ASW.Terrible),
                Answer('Bad', ASW.Bad),
                Answer('Soso', ASW.Soso),
                Answer('Good', ASW.Good),
                Answer('Excellent', ASW.Excellent),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "2.  오늘 당신의 건강 상태는 어떤가요?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "NewFont",
                  ),
                ),
                Answer2('Terrible', ASW2.Terrible),
                Answer2('Bad', ASW2.Bad),
                Answer2('Bad', ASW2.Soso),
                Answer2('Good', ASW2.Good),
                Answer2('Excellent', ASW2.Excellent),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "3.  오늘 당신의 라인전은 어떤가요?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "NewFont",
                  ),
                ),
                Answer3('Terrible', ASW3.Terrible),
                Answer3('Bad', ASW3.Bad),
                Answer3('Soso', ASW3.Soso),
                Answer3('Good', ASW3.Good),
                Answer3('Excellent', ASW3.Excellent),
                const Text(
                  "3.  오늘 먹은 햄버거의 맛은?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "NewFont",
                  ),
                ),
                Answer3('Terrible', ASW3.Terrible),
                Answer3('Bad', ASW3.Bad),
                Answer3('Soso', ASW3.Soso),
                Answer3('Good', ASW3.Good),
                Answer3('Excellent', ASW3.Excellent),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListTile Answer4(String text, ASW4 asw) {
    return ListTile(
      title: Text(text),
      leading: Radio<ASW4>(
        value: asw,
        groupValue: _character4,
        onChanged: (ASW4? value) {
          setState(() {
            _character4 = value;
          });
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListTile Answer3(String text, ASW3 asw) {
    return ListTile(
      title: Text(text),
      leading: Radio<ASW3>(
        value: asw,
        groupValue: _character3,
        onChanged: (ASW3? value) {
          setState(() {
            _character3 = value;
          });
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListTile Answer2(String text, ASW2 asw) {
    return ListTile(
      title: Text(text),
      leading: Radio<ASW2>(
        value: asw,
        groupValue: _character2,
        onChanged: (ASW2? value) {
          setState(() {
            _character2 = value;
          });
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListTile Answer(String text, ASW asw) {
    return ListTile(
      title: Text(text),
      leading: Radio<ASW>(
        value: asw,
        groupValue: _character,
        onChanged: (ASW? value) {
          setState(() {
            _character = value;
          });
        },
      ),
    );
  }
}
