class Metadata {
  String? code;
  Null message;
  bool? success;
  List<Result>? result;

  Metadata({this.code, this.message, this.success, this.result});

  Metadata.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  int? id;
  String? fileIdentifier;
  String? title;
  String? purpose;
  String? urlImage;
  MappingMetadata? mappingMetadata;

  Result(
      {this.id,
      this.fileIdentifier,
      this.title,
      this.purpose,
      this.urlImage,
      this.mappingMetadata});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileIdentifier = json['fileIdentifier'];
    title = json['title'];
    purpose = json['purpose'];
    urlImage = json['urlImage'];
    mappingMetadata = json['mappingMetadata'] != null
        ? new MappingMetadata.fromJson(json['mappingMetadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileIdentifier'] = this.fileIdentifier;
    data['title'] = this.title;
    data['purpose'] = this.purpose;
    data['urlImage'] = this.urlImage;
    if (this.mappingMetadata != null) {
      data['mappingMetadata'] = this.mappingMetadata!.toJson();
    }
    return data;
  }
}

class MappingMetadata {
  String? metadataIdentifier;
  String? gsWorkspace;
  String? gsLayerName;
  int? mapSheetNumber;
  int? parcelLandNum;
  String? communeCode;
  String? bounds;
  String? coordinateCode;

  MappingMetadata(
      {this.metadataIdentifier,
      this.gsWorkspace,
      this.gsLayerName,
      this.mapSheetNumber,
      this.parcelLandNum,
      this.communeCode,
      this.bounds,
      this.coordinateCode});

  MappingMetadata.fromJson(Map<String, dynamic> json) {
    metadataIdentifier = json['metadataIdentifier'];
    gsWorkspace = json['gsWorkspace'];
    gsLayerName = json['gsLayerName'];
    mapSheetNumber = json['mapSheetNumber'];
    parcelLandNum = json['parcelLandNum'];
    communeCode = json['communeCode'];
    bounds = json['bounds'];
    coordinateCode = json['coordinateCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['metadataIdentifier'] = this.metadataIdentifier;
    data['gsWorkspace'] = this.gsWorkspace;
    data['gsLayerName'] = this.gsLayerName;
    data['mapSheetNumber'] = this.mapSheetNumber;
    data['parcelLandNum'] = this.parcelLandNum;
    data['communeCode'] = this.communeCode;
    data['bounds'] = this.bounds;
    data['coordinateCode'] = this.coordinateCode;
    return data;
  }
}
