import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 190),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      tabs: [
                        Tab(text: 'Ưu tiên'),
                        Tab(text: 'Khác'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Content of Tab 1')),
                  Center(child: Text('Content of Tab 2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
