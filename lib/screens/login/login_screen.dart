import 'package:ecommerce_app/cubit/cubit.dart';
import 'package:ecommerce_app/models/email_model.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ingreso'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _EmailInput(),
            const SizedBox(height: 10),
            _PasswordInput(),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().logInWithCredentials();
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                primary: Colors.black,
                fixedSize: const Size(200, 40),
              ),
              child: Text(
                'Ingreso',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            const _GoogleLoginButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: 'Email'),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: 'Contraseña'),
          obscureText: true,
        );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginCubit>().logInWithGoogle();
        Navigator.pushNamed(context, '/profile');
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        primary: Colors.white,
        fixedSize: const Size(200, 40),
      ),
      child: Text(
        'Ingresar con Google',
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black),
      ),
    );
  }
}


