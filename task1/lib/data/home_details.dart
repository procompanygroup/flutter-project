class HomeDetails {
  final int id;
  final String realModel, name, periodTime, desc, owner, price, location, image;

  HomeDetails({
    required this.realModel,
    required this.name,
    required this.periodTime,
    required this.desc,
    required this.owner,
    required this.price,
    required this.id,
    required this.location,
    required this.image,
  });

  factory HomeDetails.fromJson(Map<String, dynamic> json) {
    return HomeDetails(
        id: json['id'] != null ? int.parse(json['id'].toString()) : 0,
        name: json['name'] != null ? json['name'].toString() : '',
        image: json['image'] != null ? json['image'].toString() : '',
        desc: json['desc'] != null ? json['desc'].toString() : '',
        periodTime:
            json['periodtime'] != null ? json['periodtime'].toString() : '',
        location: json['Location'] != null ? json['Location'].toString() : '',
        price: json['price'] != null ? json['price'].toString() : '',
        realModel:
            json['realmodel'] != null ? json['realmodel'].toString() : '',
        owner: json['owner'] != null ? json['owner'].toString() : '');
  }
}
