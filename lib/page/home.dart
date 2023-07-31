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
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: ListBanBe()),
                  const Center(child: Text('Content of Tab 2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListBanBe extends StatelessWidget {
  List<String> dataList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  ListBanBe({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, index) {
        String item = dataList[index];
        return ListTile(
          title: Text(item),
        );
      },
    );
  }
}
