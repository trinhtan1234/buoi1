import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataJson {
  String? code;
  Null message;
  bool? success;
  List<Result>? result;

  DataJson({this.code, this.message, this.success, this.result});

  factory DataJson.fromJson(Map<String, dynamic> json) {
    return DataJson(
      code: json['code'],
      message: json['message'],
      success: json['success'],
      result: List<Result>.from(json['result'].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  int? key;
  String? title;
  String? code;
  bool? canChangeOpacity;
  String? type;
  int? parentId;
  String? geoType;
  List<Children>? children;
  bool? isCategory;

  Result({
    this.key,
    this.title,
    this.code,
    this.canChangeOpacity,
    this.type,
    this.parentId,
    this.geoType,
    this.children,
    this.isCategory,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      key: json['key'],
      title: json['title'],
      code: json['code'],
      canChangeOpacity: json['canChangeOpacity'],
      type: json['type'],
      parentId: json['parentId'],
      geoType: json['geoType'],
      children: List<Children>.from(
          json['children'].map((x) => Children.fromJson(x))),
      isCategory: json['isCategory'],
    );
  }
}

class Children {
  int? key;
  String? title;
  String? code;
  bool? canChangeOpacity;
  String? type;
  int? parentId;
  String? geoType;
  List<Children>? children;
  bool? isCategory;

  Children({
    this.key,
    this.title,
    this.code,
    this.canChangeOpacity,
    this.type,
    this.parentId,
    this.geoType,
    this.children,
    this.isCategory,
  });

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
      key: json['key'],
      title: json['title'],
      code: json['code'],
      canChangeOpacity: json['canChangeOpacity'],
      type: json['type'],
      parentId: json['parentId'],
      geoType: json['geoType'],
      children: json['children'] != null
          ? List<Children>.from(
              json['children'].map((x) => Children.fromJson(x)))
          : null,
      isCategory: json['isCategory'],
    );
  }
}

class PrimaryMessage extends StatefulWidget {
  const PrimaryMessage({Key? key}) : super(key: key);

  @override
  State<PrimaryMessage> createState() => _PrimaryMessageState();
}

class _PrimaryMessageState extends State<PrimaryMessage> {
  late Future<DataJson> futureDataJson;

  @override
  void initState() {
    super.initState();
    futureDataJson = fetchDataJson();
  }

  Future<DataJson> fetchDataJson() async {
    final response = await http.get(Uri.parse(
        'http://10.8.0.2:30579/api/layer/customer-datas/ban-do-dia-chinh'));
    if (response.statusCode == 200) {
      final decodebBody = utf8.decode(response.bodyBytes);

      return DataJson.fromJson(jsonDecode(decodebBody));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        child: FutureBuilder<DataJson>(
          future: futureDataJson,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.result!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Key: ${snapshot.data!.result![index].key}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${snapshot.data!.result![index].title}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text('Code: ${snapshot.data!.result![index].code}'),
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
