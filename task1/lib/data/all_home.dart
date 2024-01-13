class HomeData {
  final String name, desc, image, category;
  int id, periodtime, isFavorite;

  HomeData(
      {required this.desc,
      required this.id,
      required this.name,
      required this.image,
      required this.periodtime,
      required this.isFavorite,
      required this.category});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        desc: json['desc'] as String,
        periodtime: int.tryParse(json['periodtime'].toString()) ?? 0,
        isFavorite: json['isFavorite'] as int,
        category: json['category'] as String);
  }
}
