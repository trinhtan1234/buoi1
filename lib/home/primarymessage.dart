import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'contact_model.dart';

class PrimaryMessage extends StatefulWidget {
  const PrimaryMessage({super.key});

  @override
  State<PrimaryMessage> createState() => _PrimaryMessageState();
}

class _PrimaryMessageState extends State<PrimaryMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text('${data.error}'));
          } else if (data.hasData) {
            var items = data.data as List<ContactModel>;

            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Text(items[index].toString()),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    items[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(items[index].phone.toString()),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<List<ContactModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/danhba.json');
    final list = json.decoder(jsondata) as List<dynamic>;

    return list.map((e) => ContactModel.fromJson(e)).toList();
  }
}
