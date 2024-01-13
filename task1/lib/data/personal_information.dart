class Personal {
  final String userName,
      mobile,
      nationality,
      maritalStatus,
      email,
      image,
      password;
  final int id, gender;

  Personal(
      {required this.userName,
      required this.mobile,
      required this.nationality,
      required this.image,
      required this.gender,
      required this.email,
      required this.password,
      required this.maritalStatus,
      required this.id});

  factory Personal.fromJson(Map<String, dynamic> json) {
    return Personal(
        id: json['id'] as int,
        userName: json['userName'] as String,
        image: json['image'] as String,
        gender: json['gender'] as int,
        mobile: json['mobile'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        maritalStatus: json['maritalStatus'] as String,
        nationality: json['nationality'] as String);
  }
}
