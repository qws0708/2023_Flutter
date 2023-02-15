import 'package:firebase/appProject/flower.dart';
import 'package:firebase/appProject/grape.dart';
import 'package:firebase/appProject/setting.dart';
import 'package:flutter/material.dart';
import 'package:firebase/appProject/main.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'EasyPage',
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: const EasyPage(),
  ));
}

class EasyPage extends StatefulWidget {
  const EasyPage({super.key});

  @override
  State<EasyPage> createState() => _EasyPageState();
}

class _EasyPageState extends State<EasyPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Frist Project!"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Flower(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    child: const Text("Flower"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    child: const Text("Survey"),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Grape(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    child: const Text("Grape"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Setting(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    child: const Text("Setting"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
