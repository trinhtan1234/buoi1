import 'package:flutter/material.dart';

enum ChatStatus { online, offline, busy }

class ChatModel {
  final String image;
  final String name;
  final ChatStatus status;

  ChatModel(this.image, this.name, this.status);
}

class ContactScreen extends StatelessWidget {
  final listChat = [
    ChatModel('assets/girl.jpg', 'Nguyen Van A', ChatStatus.online),
    ChatModel('assets/girl.jpg', 'Nguyen Van B', ChatStatus.online),
    ChatModel('assets/girl.jpg', 'Nguyen Van C', ChatStatus.online),
    ChatModel('assets/girl.jpg', 'Nguyen Van D', ChatStatus.online),
    ChatModel('assets/girl.jpg', 'Nguyen Van E', ChatStatus.online),
    ChatModel('assets/girl.jpg', 'Nguyen Van F', ChatStatus.online)
  ];
  // const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: listChat.length,
                itemBuilder: (context, index) {
                  return _buildUserItem(listChat[index]);
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserItem(ChatModel item) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(item.image))),
          )
        ],
      ),
    );
  }
}
