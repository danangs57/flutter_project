class Area {
  String id;
  final String name;

  Area({this.id = '', required this.name});

  Map<String, dynamic> toJson() => {id: id, name: name};

  static Area fromJson(Map<String, dynamic> json) =>
      Area(id: json['id'], name: json['name']);
}
