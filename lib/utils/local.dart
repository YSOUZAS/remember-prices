class Local {
  int id;
  String name;
  List<String> fr;

  Local({this.id, this.name, this.fr});

  Local.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fr = json['fr'].cast<String>();
  }
  Local.fromMap(Map<String, Object> json) {
    id = json['id'];
    name = json['name'];
    fr = json['fr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fr'] = this.fr;
    return data;
  }
}
