
class HomeSearchModel {

  String? title;
  String? name;
  String? type;

  HomeSearchModel({
    this.name,
    this.title,
    this.type,
  });
  HomeSearchModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['name'] = name;

    return data;
  }
}