import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/models.dart';

import 'base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(User user) async {
    bool userExist =
        (await _firebaseFirestore.collection('users').doc(user.id).get())
            .exists;
    if (userExist) {
      return;
    } else {
      await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
    }

    
  }

  @override
  Stream<User> getUser(String userId) {
    print('Obteniendo de la base datos cloud firestore');
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(User user) async {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then(
          (value) => print('User document updated.'),
        );
  }
}
