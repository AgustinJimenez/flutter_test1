import 'package:flutter/material.dart';

SafeArea CustomContentContainer(List <Widget> content) => SafeArea(
  child: SingleChildScrollView(
    child: Column(children: <Widget> [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Column(
          children: content
        )
      )
    ])
  )
);
