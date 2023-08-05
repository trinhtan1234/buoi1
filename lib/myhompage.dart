import 'package:buoi1/page/danhba.dart';
import 'package:buoi1/page/home.dart';
import 'package:buoi1/page/khampha.dart';
import 'package:buoi1/page/nhatky.dart';
import 'package:buoi1/person/account.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchTextChanged(String searchText) {
    setState(() {});
  }

// tạo page cho từng tabbar
  final List<Widget> _pages = <Widget>[
    const MyHome(),
    const DanhBa(),
    const KhamPha(),
    const NhatKy(),
    const CaNhan(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 155, 226),
        centerTitle: true,
        title: TextField(
          style: const TextStyle(fontSize: 20, color: Colors.white),
          controller: _searchController,
          onChanged: _onSearchTextChanged,
          decoration: const InputDecoration(
            labelText: 'Tìm kiếm',
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            _searchController.clear();
            _onSearchTextChanged('');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_2_sharp,
              color: Colors.white,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.maps_ugc_outlined,
            ),
            label: 'Tin nhắn',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_calendar_outlined,
            ),
            label: 'Danh bạ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_outlined,
            ),
            label: 'Khám phá',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.watch_later_outlined,
            ),
            label: 'Nhật ký',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity_outlined,
            ),
            label: 'Cá nhân',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
