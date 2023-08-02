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
                  Center(child: ListBanBe()),
                  Center(child: LisChatKhac()),
                ],
              ),
            ),
          ]),
        ));
  }
}

// ignore: must_be_immutable
class ListBanBe extends StatefulWidget {
  const ListBanBe({super.key});

  @override
  State<ListBanBe> createState() => _ListBanBeState();
}

class _ListBanBeState extends State<ListBanBe> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LisChatKhac extends StatefulWidget {
  const LisChatKhac({super.key});

  @override
  State<LisChatKhac> createState() => _LisChatKhacState();
}

class _LisChatKhacState extends State<LisChatKhac> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
