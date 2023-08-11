import 'package:flutter/material.dart';

class MessengerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessengerScreen(),
    );
  }
}

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messenger'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20, // Số tin nhắn trong danh sách
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // Ảnh đại diện của người gửi
              radius: 30,
              backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
            ),
            title: Text('Người gửi $index'),
            subtitle: Text('Nội dung tin nhắn $index'),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('11:30 AM'), // Thời gian tin nhắn
                SizedBox(height: 5),
                Icon(Icons.check_circle), // Trạng thái tin nhắn đã gửi
              ],
            ),
            onTap: () {
              // Mở cuộc trò chuyện khi nhấn vào tin nhắn
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tạo cuộc trò chuyện mới
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
