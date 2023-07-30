import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Ưu tiên'),
          Tab(text: 'Khác'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [],
          )
        ],
      ),
      // appBar: AppBar(
      //   bottom: TabBar(
      //     controller: _tabController,
      //     isScrollable: true,
      //     tabs: [
      //       const Tab(text: 'Ưu tiên'),
      //       const Tab(text: 'Khác'),
      //     ],
      //   ),
      // ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: const [
      //     Center(
      //       child: Text('Nội dung cho tab 1'),
      //     ),
      //     Center(
      //       child: Text('Nội dung cho tab 2'),
      //     ),
      //   ],
      // ),
    );
  }
}
