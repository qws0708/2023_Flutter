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
                // 커스텀 위젯으로 바꿔야 하는데 Icon을 변수로 만드는 법 알아야 함
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
              // 페이지 이동 넣어야 함
              Image.asset("assets/images/flower.png"),
              const Icon(Icons.checklist_rtl_outlined),
              const Icon(Icons.pending_actions_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
