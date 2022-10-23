import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/auth/base_auth_repository.dart';
import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _userRepository = userRepository;

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

  /*  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  } */

  /* // Return current user [User.empty]
  User get currentUser {
    return User.empty;
  }

  // Create new User with email and password
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  // SignIn with Email and Password
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

// Sign out the current user
  Future<void> logOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

// Return a list of Auth Users
extension on auth.User {
  User get toUser {
    return User(id: uid, email: email, fullName: displayName);
  }
}

class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'correo invalido':
        return const SignUpWithEmailAndPasswordFailure(
          'El email es invalido o no esta correctamente escrito.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'Este usuario no esta activo. Contactar soporte.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'Ya existe una cuenta para este correo.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'La operación no esta permitida.  Contactar soporte.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Por favor suministrar una contraseña mas fuerte.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'Ocurrio una excepción desconocida.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'correo invalido':
        return const LogInWithEmailAndPasswordFailure(
          'El email es invalido o no esta correctamente escrito.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'Este usuario no esta activo. Contactar soporte.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'No se encuentra este email, por favor crea una cuenta.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Contraseña incorrecta, prueba otra vez por favor.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message; */
}

class LogOutFailure implements Exception {}
