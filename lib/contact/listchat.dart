import 'package:flutter/material.dart';

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.fact_check,
              size: 30,
              color: Colors.blue,
            ),
          )
        ],
        title: Center(
          child: Text(
            'Chats',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        leading: Container(
          child: Icon(
            Icons.view_list,
            size: 30,
            color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchText(),
            MyHorizontalListView(),
            MyVerticalListView(),
          ],
        ),
      ),
    );
  }
}

class SearchText extends StatefulWidget {
  const SearchText({super.key});

  @override
  State<SearchText> createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHorizontalListView extends StatelessWidget {
  const MyHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 60,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 77,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-1/335049138_719038356676796_4922898347675381291_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=2b6aad&_nc_ohc=ESeobOO9KIsAX_LIrjK&_nc_ht=scontent.fhan5-8.fna&oh=00_AfBkodhxNgU4s599bne6pmkGYlR9ytAILzGPKXxClETc9Q&oe=64DB01DC'),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Nguyễn Văn $index',
                      style: TextStyle(color: Colors.black, fontSize: 8),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyVerticalListView extends StatelessWidget {
  const MyVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-1/335049138_719038356676796_4922898347675381291_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=2b6aad&_nc_ohc=ESeobOO9KIsAX_LIrjK&_nc_ht=scontent.fhan5-8.fna&oh=00_AfBkodhxNgU4s599bne6pmkGYlR9ytAILzGPKXxClETc9Q&oe=64DB01DC'),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text('Mô tả $index',
                    style: TextStyle(color: Colors.black, fontSize: 10)),
              ],
            ),
          );
        },
      ),
    );
  }
}
