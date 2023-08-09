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
        padding: EdgeInsets.all(10),
        child: FutureBuilder<Metadata>(
          future: futureMetadataJson,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Lỗi: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: snapshot.data?.result?.length ?? 0,
                itemBuilder: (context, index) {
                  final urlImage = snapshot.data?.result?[index].urlImage;
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      image: urlImage != null && urlImage.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(urlImage),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.6),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${snapshot.data!.result![index].title}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
