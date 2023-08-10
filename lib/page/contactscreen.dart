import 'package:flutter/material.dart';

enum ChatStatus { online, offline, busy }

class ChatModel {
  final String image;
  final String name;
  final ChatStatus status;

  ChatModel(this.image, this.name, this.status);
}

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final listChat = [
    ChatModel('assets/images/girl.png', 'Nguyen Van A', ChatStatus.online),
    ChatModel('assets/images/girl.png', 'Nguyen Van B', ChatStatus.online),
    ChatModel('assets/images/girl.png', 'Nguyen Van C', ChatStatus.online),
    ChatModel('assets/images/girl.png', 'Nguyen Van D', ChatStatus.online),
    ChatModel('assets/images/girl.png', 'Nguyen Van E', ChatStatus.online),
    ChatModel('assets/images/girl.png', 'Nguyen Van F', ChatStatus.online)
  ];

  // const ContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(padding: EdgeInsets.only(right: 20)),
            Icon(
              Icons.article,
              size: 20,
              color: Colors.blue,
            ),
          ],
          title: Center(
            child: Text(
              'Chats',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          leading: Icon(
            Icons.dehaze,
            size: 20,
            color: Colors.blue,
          )),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
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
            Expanded(
              child: ListView.separated(
                itemCount: listChat.length,
                itemBuilder: (context, index) {
                  return _buildChatItem(listChat[index]);
                },
                separatorBuilder: (context, index) => Divider(
                  height: 1,
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

  Widget _buildChatItem(ChatModel item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(item.image),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(item.name), Text('')],
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration:
                BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
