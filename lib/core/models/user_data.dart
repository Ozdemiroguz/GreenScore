import 'package:greenapp/core/models/bag.dart';

class UserData {
  final String email;
  final String name;
  final String surname;
  final String id;
  final double naturePoint;
  final double balance;
  final String? profileImage;
  final double savedCo2;
  final int recycled;
  final List<Bag>? bag;

  UserData({
    required this.email,
    required this.id,
    required this.name,
    required this.surname,
    required num naturePoint,
    required num balance,
    this.profileImage,
    required num savedCo2,
    required this.recycled,
    this.bag,
  })  : naturePoint = naturePoint.toDouble(),
        balance = balance.toDouble(),
        savedCo2 = savedCo2.toDouble();

  //initial value
  static UserData get initial => UserData(
        email: '',
        id: '',
        name: '',
        surname: '',
        naturePoint: 0,
        balance: 0,
        profileImage: '',
        savedCo2: 0,
        recycled: 0,
        bag: [],
      );

  //from json
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      naturePoint: json['nature_point'],
      balance: json['balance'],
      profileImage: json['profile_image'],
      savedCo2: json['saved_co2'],
      recycled: json['recycled'],
      bag: json['bag'] != null
          ? List<Bag>.from(json['bag'].map((x) => Bag.fromJson(x)))
          : null,
    );
  }
}
