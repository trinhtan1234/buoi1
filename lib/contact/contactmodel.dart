class TestJson {
  String? name;
  String? phone;

  TestJson({this.name, this.phone});

  TestJson.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    return data;
  }
}
