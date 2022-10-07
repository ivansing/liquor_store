import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SignupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
                const SizedBox(height: 16),
                _EmailInput(),
                const SizedBox(height: 8),
                _PasswordInput(),
                const SizedBox(height: 8),
                _ConfirmPasswordInput(),
                const SizedBox(height: 8),
                _SignUpButton(),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            key: const Key('signUpForm_emailInput_textField'),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'email',
              helperText: '',
              errorText: 'El email no es valido',
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('signUpForm_passwordInput_textField'),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        helperText: '',
        errorText: 'La contraseña no es valida',
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('signUpForm_confirmedPasswordInput_textField'),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'confirm password',
        helperText: '',
        errorText: 'passwords do not match',
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key('signUpForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: const Text('Registrarse'),
    );
  }
}
