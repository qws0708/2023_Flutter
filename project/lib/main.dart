import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.yard_outlined,
                  color: Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.checklist_rtl_outlined,
                  color: Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.pending_actions_sharp,
                  color: Colors.black,
                )),
              ],
            ),
            title: Text(
              'How About Your Today?',
              style: TextStyle(
                color: Colors.blue.shade300,
                fontWeight: FontWeight.w600,
                fontFamily: "NewFont",
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Image.asset("assets/images/flower.png"),
              const Icon(Icons.directions_transit),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
