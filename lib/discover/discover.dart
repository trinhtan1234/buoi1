import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'discoverModel.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  late Future<Metadata> futureMetadataJson;

  @override
  void initState() {
    super.initState();
    futureMetadataJson = fetchMetadataJson();
  }

  Future<Metadata> fetchMetadataJson() async {
    final response = await http.get(Uri.parse(
      'http://10.8.0.2:30579/api/mdata/customer/data?page=1&size=10',
    ));
    if (response.statusCode == 200) {
      final decodebBody = utf8.decode(response.bodyBytes);
      return Metadata.fromJson(jsonDecode(decodebBody));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        child: FutureBuilder<Metadata>(
          future: futureMetadataJson,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Lỗi: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.result!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 200,
                    child: ListTile(
                      title: Text(
                        '${snapshot.data!.result![index].id}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data!.result![index].title}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text('${snapshot.data!.result![index].purpose}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
