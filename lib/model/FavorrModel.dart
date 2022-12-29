class Favorr {
  String id;
  final String area_id;
  final String user_id;
  final String title;

  Favorr(
      {this.id = '',
      required this.area_id,
      required this.user_id,
      required this.title});

  Map<String, dynamic> toJson() =>
      {id: id, title: title, user_id: user_id, area_id: area_id};

  static Favorr fromJson(Map<String, dynamic> json) => Favorr(
      id: json['id'],
      title: json['title'],
      area_id: json['area_id'],
      user_id: json['user_id']);
}
