/// Validation erros for the [ConfirmedPassword] [FormzInput]

import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError {
  // Generic invalid error.
  invalid
}

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  final String password;

  const ConfirmedPassword.pure({
    this.password = '',
  }) : super.pure('');

  const ConfirmedPassword.dirty({
    required this.password,
    String value = '',
  }) : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}
