import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modelKhamPha.dart';

class KhamPha extends StatefulWidget {
  const KhamPha({Key? key}) : super(key: key);

  @override
  State<KhamPha> createState() => _KhamPhaState();
}

class _KhamPhaState extends State<KhamPha> {
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
      body: FutureBuilder<List<String>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Lỗi: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Colors.green,
                            margin: EdgeInsets.all(5.0),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 105,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.amberAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Image.network()
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          }
        },
      ),
    );
  }
  // body: Container(
  //   padding: EdgeInsets.all(5),
  //   child: FutureBuilder<Metadata>(
  //     future: futureMetadataJson,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return CircularProgressIndicator();
  //       } else if (snapshot.hasError) {
  //         return Text('Lỗi: ${snapshot.error}');
  //       } else if (snapshot.hasData) {
  //         return ListView.builder(
  //           itemCount: snapshot.data!.result!.length,

  //           itemBuilder: (context, index) {
  //             return Container(
  //               height: 200,
  //               width: 200,
  //               child: ListTile(
  //                 title: Text(
  //                   '${snapshot.data!.result![index].id}',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 subtitle: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       '${snapshot.data!.result![index].title}',
  //                       style: TextStyle(
  //                         fontSize: 15,
  //                       ),
  //                     ),
  //                     Text('${snapshot.data!.result![index].purpose}'),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       } else {
  //         return Text('No data available');
  //       }
  //     },
  //   ),
  // ),
//     );
//   }
// }
}
