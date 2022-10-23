part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, sucess, error }

class SignupState extends Equatable {
  final String password;
  final SignupStatus status;
  final auth.User? authUser;
  final User? user;

  bool get isFormValid => user!.email.isNotEmpty && password.isNotEmpty;

  const SignupState({
    required this.password,
    required this.status,
    this.authUser,
    this.user,
  });

  factory SignupState.initial() {
    return SignupState(
      password: '',
      status: SignupStatus.initial,
      authUser: null,
      user: User(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [password, status, authUser, user];

  SignupState copyWith({
    String? password,
    SignupStatus? status,
    auth.User? authUser,
    User? user,
  }) {
    return SignupState(
      password: password ?? this.password,
      status: status ?? this.status,
      authUser: authUser ?? this.authUser,
      user: user ?? this.user,
    );
  }
}

/* enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;

  

  @override
  List<Object?> get props => [email, password, confirmedPassword, status];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
  }) {
    
    // Returns data with a new modified fields status, keep the current one value
    // if it has been not added before.
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  
}


 */