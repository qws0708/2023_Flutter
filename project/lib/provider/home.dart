import 'package:flutter/material.dart';
import 'count_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('provider sample'),
      ),
      body: const CountHome(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => _countProvider.increase(),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => _countProvider.decrease(),
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CountHome extends StatelessWidget {
  const CountHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, countProvider, child) => Text(
          Provider.of<CountProvider>(context).count.toString(),
          style: const TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
