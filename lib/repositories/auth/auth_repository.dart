import 'package:ecommerce_app/models/models.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  // User changes emit current user
  
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  // Return current user [User.empty] 
  User get currentUser {
    return User.empty;
  }

  // Create new User with email and password
  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  // SignIn with Email and Password
  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

// Sign out the current user
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}

// Return a list of Auth Users
extension on auth.User {
  User get toUser {
    return User(id: uid, email: email, fullName: displayName);
  }
}
