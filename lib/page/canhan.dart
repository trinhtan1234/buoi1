import 'package:flutter/material.dart';

class CaNhan extends StatelessWidget {
  const CaNhan({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Đăng xuất'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
