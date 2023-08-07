class DataJson {
  String? code;
  Null message;
  bool? success;
  List<Result>? result;

  DataJson({this.code, this.message, this.success, this.result});

  DataJson.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Result.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    code = json['code'];
    canChangeOpacity = json['canChangeOpacity'];
    type = json['type'];
    parentId = json['parentId'];
    geoType = json['geoType'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    isCategory = json['isCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['code'] = this.code;
    data['canChangeOpacity'] = this.canChangeOpacity;
    data['type'] = this.type;
    data['parentId'] = this.parentId;
    data['geoType'] = this.geoType;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['isCategory'] = this.isCategory;
    return data;
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

  Children.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    code = json['code'];
    canChangeOpacity = json['canChangeOpacity'];
    type = json['type'];
    parentId = json['parentId'];
    geoType = json['geoType'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    isCategory = json['isCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['code'] = this.code;
    data['canChangeOpacity'] = this.canChangeOpacity;
    data['type'] = this.type;
    data['parentId'] = this.parentId;
    data['geoType'] = this.geoType;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['isCategory'] = this.isCategory;
    return data;
  }
}
