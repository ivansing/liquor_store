import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// [User.empty] represents an unauthenticated user.

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.fullName,
    this.address,
    this.city,
  });

  // Current's user data
  final String? email;
  final String id;
  final String? fullName;
  final String? address;
  final String? city;

  static const empty = User(id: '');

  // Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  // Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    //  If data is null, check the data type
    return User(
      id: data.containsKey('id') ? data['id'] : '',
      fullName: data.containsKey('name') ? data['name'] : '',
      email: data.containsKey('email') ? data['email'] : '',
      address: data.containsKey('category') ? data['category'] : '',
      city: data.containsKey('imageUrl') ? data['imageUrl'] : '',
    );
  }

   Map<String, dynamic> toDocument() {
    return {
       'fullName' : fullName,
      'email': email,
      'address': address,
      'city': city, 
      
    }; 
  }

  @override
  List<Object?> get props => [email, id, fullName, address, city];
}
