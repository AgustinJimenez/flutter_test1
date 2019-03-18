import 'package:flutter/material.dart';

renderBienvenido([String message = '']) => 
  Container(
    margin: EdgeInsets.only(top: 15, bottom: 10), 
    child: 
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              message, 
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold
              )
            )
          )
        ]
      )
  );