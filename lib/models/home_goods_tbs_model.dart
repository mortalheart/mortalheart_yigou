
class HomeGoodsTbsModel {

  String? title;
  String? name;
  String? type;

  HomeGoodsTbsModel({
    this.name,
    this.title,
    this.type,
  });
  HomeGoodsTbsModel.fromJson(Map<String, dynamic> json) {
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