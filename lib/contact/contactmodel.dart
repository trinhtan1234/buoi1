class TestJson {
  String? name;
  int? phone;
  String? link;

  TestJson({this.name, this.phone});

  TestJson.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    phone = json['Phone'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['Link'] = this.link;
    return data;
  }
}
