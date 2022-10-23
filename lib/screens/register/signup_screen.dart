//import 'package:ecommerce_app/cubit/signup/signup_cubit.dart';
import 'dart:convert';

import 'package:ecommerce_app/cubit/cubit.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Registro'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<SignUpCubit, SignupState>(
          builder: (context, state) {
            return SingleChildScrollView(
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignUpCubit>().userChanged(
                              state.user!.copyWith(fullName: value),
                            );
                      },
                      labelText: 'Nombre'),
                  const SizedBox(height: 10),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignUpCubit>().userChanged(
                              state.user!.copyWith(email: value),
                            );
                      },
                      labelText: 'Email'),
                  const SizedBox(height: 10),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignUpCubit>().userChanged(
                              state.user!.copyWith(address: value),
                            );
                      },
                      labelText: 'Dirección'),
                  const SizedBox(height: 10),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignUpCubit>().userChanged(
                              state.user!.copyWith(city: value),
                            );
                      },
                      labelText: 'Ciudad'),
                  const SizedBox(height: 10),
                  _PasswordInput(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SignUpCubit>().signUpWithCredentials();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      primary: Colors.black,
                      fixedSize: Size(200, 40),
                    ),
                    child: Text(
                      'Registro',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _UserInput extends StatelessWidget {
  const _UserInput({
    Key? key,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  final Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignupState>(
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(labelText: labelText),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignupState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<SignUpCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: 'Contraseña'),
          obscureText: true,
        );
      },
    );
  }
}
