import 'package:flutter/material.dart';

ThemeData ThemeSetup() {
  const colorPrimary = Color.fromRGBO(255, 153, 0, 1); //rgba(255, 153, 0, 1)
  const colorSecondary = Color.fromRGBO(35, 47, 62, 1); //rgba(35, 47, 62, 1)
  const colorPrimaryVariant =
      Color.fromRGBO(230, 138, 0, 1); //rgba(230,138,0, 1)

  return ThemeData(
    fontFamily: 'SarySoft',
    //brightness: Brightness.light,
    //primarySwatch: Colors.blueGrey,
    //buttonColor: Color.fromRGBO(255,153,0, 1),
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      subhead: TextStyle(fontSize: 18, color: colorPrimary),
      body1: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
      body2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
    ),
    colorScheme: ColorScheme(
      primary: colorPrimary,
      secondary: colorSecondary,
      primaryVariant: colorPrimaryVariant,
      secondaryVariant: Color.fromRGBO(81, 93, 110, 1),
      surface: colorSecondary,
      background: Colors.white,
      error: Colors.red,
      onPrimary: colorPrimary,
      brightness: Brightness.light,
      onBackground: Colors.white,
      onError: Colors.red,
      onSecondary: colorSecondary,
      onSurface: colorSecondary,
    ),
  );
}
