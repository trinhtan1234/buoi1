import 'package:flutter/material.dart';

class OtherMessages extends StatefulWidget {
  const OtherMessages({super.key});

  @override
  State<OtherMessages> createState() => _OtherMessagesState();
}

class _OtherMessagesState extends State<OtherMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      child: ListTile(
        title: Text('data'),
        subtitle: Column(
          children: [
            Text('title:'),
            Text('Code'),
          ],
        ),
      ),
    );
  }
}
