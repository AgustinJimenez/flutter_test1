import 'package:flutter/material.dart';

Container CustomContentContainer(List <Widget> content, {bool padding = true}) => Container(
  child: SingleChildScrollView(
    child: Column(children: <Widget> [
      Container(
        padding: EdgeInsets.symmetric(horizontal: padding?15:0),
        alignment: Alignment.center,
        child: Column(
          children: content
        )
      )
    ])
  )
);
