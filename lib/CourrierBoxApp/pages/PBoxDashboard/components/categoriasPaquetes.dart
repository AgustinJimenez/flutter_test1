import 'package:flutter/material.dart';

renderCategoriasPaquetes({String title: '', VoidCallback onTapDown(TapDownDetails details), int value, double mTop: 5, double mRight: 0, double mBottom: 5, double mLeft: 0}) =>
  GestureDetector(
    onTapDown: onTapDown,
    child: Container(
      child: Column(
        children: <Widget> [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(title, style: TextStyle( fontSize: 20) ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(value.toString(), style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold) ),
          )
        ]
      ),
      height: 80,
      width: 200,
      margin: EdgeInsets.only(top:mTop, right: mRight, bottom: mBottom, left: mLeft),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(255, 153, 0, 1)),
        color: Color.fromRGBO(255, 229, 210, 1),//rgba(255, 229, 210, 1)
        borderRadius: BorderRadius.horizontal(left: Radius.circular(5), right: Radius.circular(5))
      ),
    )
  );