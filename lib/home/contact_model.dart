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
