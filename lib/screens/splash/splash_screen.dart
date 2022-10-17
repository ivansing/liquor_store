import 'dart:async';
import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        // testing dev
          print(
            'From home_screen routee ${BlocProvider.of<AuthBloc>(context).state.status}');
        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const LoginScreen()
            : HomeScreen();
      }, 
    );
  }

  @override
  Widget build(BuildContext context) {
  //  Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));

    return WillPopScope(
        onWillPop: () async => false,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print("Listener");
            if (state.status == AuthStatus.unauthenticated) {
             
               
               
                 Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  ModalRoute.withName('/login'),
                 );
             
            } else if (state.status == AuthStatus.authenticated) {
                Timer(
                const Duration(seconds: 1),
                () => Navigator.of(context).pushNamed(HomeScreen.routeName),
              ); 
            }
          },
          child: Scaffold(
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
                padding: const EdgeInsets.symmetric(
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
          )),
        ));
  }
}
