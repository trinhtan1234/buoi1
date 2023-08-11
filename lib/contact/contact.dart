import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestJson extends StatelessWidget {
  Future<List<dynamic>> _loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/danhba.json');
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data'),
            );
          } else {
            // Add a null check using the ! operator
            List<dynamic> jsonData = snapshot.data!;

            return ListView.builder(
              itemCount: jsonData.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> itemData = jsonData[index];

                String itemName = itemData['Name'] ?? 'No name';
                String itemphone = itemData['Phone'] != null
                    ? itemData['Phone'].toString()
                    : 'No Phone';
                String itemImageUrl = itemData['Link'] ?? '';
                return ListTile(
                  title: Text(itemName),
                  subtitle: Text(itemphone),
                  leading: itemImageUrl.isNotEmpty
                      ? Image.network(itemImageUrl)
                      : Icon(Icons.image),
                  trailing: Icon(Icons.call),
                );
              },
            );
          }
        },
      ),
    );
  }
}
