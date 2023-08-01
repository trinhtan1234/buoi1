import 'package:buoi1/model/model.dart';
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
class ListBanBe extends StatelessWidget {
  List<DanhBaBan> dataList = [];

  ListBanBe({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, index) {
        DanhBaBan danhBa = dataList[index];
        return ListTile(
          title: Text(danhBa.name ?? ''),
          subtitle: Text(danhBa.phone?.toString() ?? ''),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class LisChatKhac extends StatelessWidget {
  List<String> dataList = [
    'Item khác 1',
    'Item khác 2',
    'Item khác 3',
  ];
  LisChatKhac({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, index) {
          String item = dataList[index];
          return ListTile(
            title: Text(item),
          );
        });
  }
}
