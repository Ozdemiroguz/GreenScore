import 'package:greenapp/core/models/bag.dart';
import 'package:latlong2/latlong.dart';

class UserData {
  final String email;
  final String name;
  final String surname;
  final String id;
  final String phone;
  final double naturePoint;
  final double balance;
  final String? profileImage;
  final double savedCo2;
  final int recycled;

  final List<Bag>? bag;
  final LatLng? location;

  UserData({
    required this.email,
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required num naturePoint,
    required num balance,
    this.profileImage,
    required num savedCo2,
    required this.recycled,
    this.bag,
    this.location,
  })  : naturePoint = naturePoint.toDouble(),
        balance = balance.toDouble(),
        savedCo2 = savedCo2.toDouble();

  //initial value
  static UserData get initial => UserData(
        email: '',
        id: '',
        name: '',
        surname: '',
        phone: '',
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
      phone: json['phone'],
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
  //copy with
  UserData copyWith({
    String? email,
    String? id,
    String? name,
    String? surname,
    String? phone,
    double? naturePoint,
    double? balance,
    String? profileImage,
    double? savedCo2,
    int? recycled,
    List<Bag>? bag,
    LatLng? location,
  }) {
    return UserData(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      naturePoint: naturePoint ?? this.naturePoint,
      balance: balance ?? this.balance,
      profileImage: profileImage ?? this.profileImage,
      savedCo2: savedCo2 ?? this.savedCo2,
      recycled: recycled ?? this.recycled,
      bag: bag ?? this.bag,
      location: location ?? this.location,
    );
  }
}
