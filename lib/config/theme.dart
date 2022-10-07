
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  // ignore: prefer_const_constructors
  return TextTheme(
    headline1: const TextStyle(
      color:  Colors.white,
      fontSize: 30,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ),
    headline2: const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ),
    headline3:const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ),
    headline4:const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold
    ),
    headline5:const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal
    ),
    headline6:const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal
    ),
    bodyText1:const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal
    ),
    bodyText2:const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal
    ),
  );
}