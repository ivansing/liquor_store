import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authenticationRepository;
  final UserRepository _userRepository;
  late final StreamSubscription<User> _userSubscription;
  late final StreamSubscription<User> _authSubscription;

  AuthBloc({required AuthRepository authenticationRepository, required UserRepository userRepository,
    })
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(authenticationRepository.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);

    
     _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AuthUserChanged(user)),
    ); 
  }

  

  void _onUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user.isNotEmpty ? AuthState.authenticated(event.user)
      : const AuthState.unauthenticated()
    );
  }

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

} 
