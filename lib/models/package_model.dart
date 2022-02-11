class Packages {
  Packages({
    required this.name,
    required this.id,
    // ignore: non_constant_identifier_names
    required this.image_url,
  });
  late final String name;
  late final int id;
  // ignore: non_constant_identifier_names
  late final String image_url;

  Packages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image_url = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['image_url'] = image_url;
    return _data;
  }
}
