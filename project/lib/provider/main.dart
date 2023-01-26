import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';
import 'home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (_) => CountProvider(),
        child: Home(),
      ),
    );
  }
}
