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
              color: Colors.blue,
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
      body: Column(
        children: [
          SearchText(),
          MyHorizontalListView(),
          Container(),
        ],
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
      height: 70,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
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
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-1/335049138_719038356676796_4922898347675381291_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=2b6aad&_nc_ohc=ESeobOO9KIsAX_LIrjK&_nc_ht=scontent.fhan5-8.fna&oh=00_AfBkodhxNgU4s599bne6pmkGYlR9ytAILzGPKXxClETc9Q&oe=64DB01DC'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
