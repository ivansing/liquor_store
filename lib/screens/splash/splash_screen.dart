import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  

  @override
  Widget build(BuildContext context) {
     Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 200,
            height: 200,
          ),
        ),
        Container(
          color: Colors.black,
          padding:const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10,
          ),
          child: Text(
            'Los Mejores Licores',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
