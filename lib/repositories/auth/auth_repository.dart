import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  // User changes emit current user
  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

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
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
