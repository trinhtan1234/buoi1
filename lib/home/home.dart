import 'package:buoi1/home/primarymessage.dart';
import 'package:flutter/material.dart';

import 'othermessages.dart';

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
          child: Column(children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 190),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      // indicatorSize: TabBarIndicatorSize.tab,
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
            SizedBox(
              height: 595,
              child: TabBarView(
                children: [
                  Center(child: PrimaryMessage()),
                  Center(child: OtherMessages()),
                ],
              ),
            ),
          ]),
        ));
  }
}

// ignore: must_be_immutable
