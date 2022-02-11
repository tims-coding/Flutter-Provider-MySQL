class Post {
  Post({
    required this.name,
    required this.id,
    required this.package,
    required this.guests,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String name;
  late final String id;
  late final String package;
  late final int guests;
  late final String createdAt;
  late final String updatedAt;

  Post.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    package = json['package'];
    guests = json['guests'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['package'] = package;
    _data['guests'] = guests;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
