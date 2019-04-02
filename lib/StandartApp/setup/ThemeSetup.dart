import 'package:flutter/material.dart';

ThemeData ThemeSetup() => 
  ThemeData(
    fontFamily: 'SarySoft',
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blue,
    buttonColor: Colors.orange,
    inputDecorationTheme: InputDecorationTheme
    (
      border: OutlineInputBorder()
      
    )
  );