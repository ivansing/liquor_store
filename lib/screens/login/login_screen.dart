import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
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
              Text('Email'),
              const SizedBox(height: 8),
               Text('Contraseña'),
              const SizedBox(height: 8),
               Text('Boton Ingreso'),
              const SizedBox(height: 8),
               Text('Google Boton'),
              const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
