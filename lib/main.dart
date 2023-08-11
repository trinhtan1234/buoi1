import 'package:buoi1/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key})
      : super(key: key); // Chú ý đến việc sử dụng Key? key thay vì super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tạo màn hình zalo',
      home: LoginScreen(),
    );
  }
}
