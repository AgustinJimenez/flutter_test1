import 'package:flutter/material.dart';

CustomAppBar() => AppBar(
  backgroundColor: Color.fromRGBO(35, 47, 62, 1.0),
  actions: <Widget>[
    Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text('Salir' ,style: TextStyle(color: Colors.white, fontSize: 20)),
      )
    ),
    Expanded(
      child: Container(
        child: Image
        (
          image: AssetImage('assets/images/puntobox.png'),
        ),
      )
    ),
    Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        child: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center)
      )
    ),
  ],
);