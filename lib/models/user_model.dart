import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;

  User({
    required this.id,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
  });

  // Edit User object

  // ignore: empty_constructor_bodies
  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    print(data);
    //  If data is null, check the data type
    return User(
      id: data.containsKey('id') ? data['id'] : '',
      fullName: data.containsKey('fullName') ? data['fullName'] : '',
      email: data.containsKey('email') ? data['email'] : '',
      address: data.containsKey('address') ? data['address'] : '',
      city: data.containsKey('city') ? data['city'] : '',
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
    };
  }

  @override
  List<Object?> get props => [id, fullName, email, address, city];
}
