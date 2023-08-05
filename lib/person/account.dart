import 'package:flutter/material.dart';

class CaNhan extends StatefulWidget {
  const CaNhan({super.key});

  @override
  State<CaNhan> createState() => _CaNhanState();
}

class _CaNhanState extends State<CaNhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100, bottom: 0, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.search,
                  size: 40,
                ),
              ],
            ),
            Container(
              height: 200,
              width: 200,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/IMG_0042.JPG',
                    height: 60,
                    width: 60,
                  ),
                  Column(
                    children: [Text('Nguyễn Thuỷ Hằng')],
                  )
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Log Out'))
          ],
        ),
      ),
    );
  }
}
