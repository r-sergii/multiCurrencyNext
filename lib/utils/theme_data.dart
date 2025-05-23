import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  //inherited colors
  backgroundColor: Colors.white,
  dialogBackgroundColor: Colors.grey[200],
  primaryColor: Colors.blue,
  // cardColor: Colors.blueGrey[50],
  cardColor: Colors.blue[900],
  secondaryHeaderColor: Colors.black,
  indicatorColor: Colors.amber,
  //
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blue[100],
    ),
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    headline1: TextStyle(color: Colors.blueGrey[800]),
    headline2: const TextStyle(
      color: Colors.blue,
    ),
  ),
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: const IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

var darkThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  //inherited colors
  backgroundColor: Colors.black, //Colors.blueGrey[900],
  dialogBackgroundColor: Colors.grey[800],
  primaryColor: Colors.white,
  // cardColor: Colors.black,
  cardColor: Colors.blue,
  secondaryHeaderColor: Colors.blue,
  indicatorColor: Colors.deepPurpleAccent,//Colors.greenAccent,
  //
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: const TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: const TextStyle(
      color: Colors.white70,
    ),
    headline2: TextStyle(
      color: Colors.grey[500],
    ),
  ),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  brightness: Brightness.dark,
);
