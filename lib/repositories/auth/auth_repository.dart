

import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/auth/base_auth_repository.dart';
import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  GoogleSignIn? _googleSignIn;
  final UserRepository _userRepository;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _userRepository = userRepository,
        _googleSignIn =
            googleSignIn ?? GoogleSignIn.standard(scopes: ['email']);

  // User changes emit current user

  @override
  Future<auth.User?> signUp({
    required User user,
    required String password,
  }) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          )
          .then(
            (value) => _userRepository.createUser(
              user.copyWith(id: value.user!.uid),
            ),
          );
    } catch (_) {}
  }

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

  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> logInWithGoogle() async {
    try {
      late final auth.AuthCredential credential;

      final googleUser = await _googleSignIn?.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _firebaseAuth.signInWithCredential(credential).then((value) {
        _userRepository.createUser(
          User(
            id: value.user!.uid,
            fullName: value.user!.displayName ?? '',
            email: value.user!.email ?? '',
          ),
        );
      });
    } catch (_) {}
  }

  

  
}

class LogOutFailure implements Exception {}
