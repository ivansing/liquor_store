//import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:equatable/equatable.dart';

/// [User.empty] represents an unauthenticated user.

class User extends Equatable {
  // Current's user data fields
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;

  const User({
    this.id,
    this.email = '',
    this.fullName = '',
    this.address = '',
    this.city = '',
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? city,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
    );
  }

  //static const empty = User(id: '');

  // Convenience getter to determine whether the current user is empty.
  // bool get isEmpty => this == User.empty;

  // Convenience getter to determine whether the current user is not empty.
  // bool get isNotEmpty => this != User.empty;

   /* factory User.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    //  If data is null, check the data type
    return User(
      id: data.containsKey('id') ? data['id'] : '',
      fullName: data.containsKey('name') ? data['name'] : '',
      email: data.containsKey('email') ? data['email'] : '',
      address: data.containsKey('category') ? data['category'] : '',
      city: data.containsKey('imageUrl') ? data['imageUrl'] : '',
    );
  } */

  /* factory User.fromSnapshot(DocumentSnapshot doc) {
    return User(
      id: doc.data().toString().contains('id') ? doc.get('id') : '',
      fullName: doc.data().toString().contains('name') ? doc.get('name') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      address: doc.data().toString().contains('address') ? doc.get('address') : '',
      city: doc.data().toString().contains('city') ? doc.get('city') : '',
    );
  } */

   factory User.fromJson(
    Map<String, dynamic> json, [
    String? id, 
  ]) {
    return User(
      id: id ?? json['id'],
      fullName:  json['fullName'],
      email:  json['email'],
      address:  json['address'],
      city:  json['city'],
    );
  } 

  Map<String, dynamic> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
    };
  }

  static const empty = User(id: '');

  @override
  List<Object?> get props => [email, id, fullName, address, city];
}
