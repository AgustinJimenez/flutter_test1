import 'package:flutter/material.dart';


Container renderDatosDeTuCasilla({ nombreCasilla = '', direccion = '', ciudad = '', codigoPostal = '' }) => Container(
  margin: EdgeInsets.only( left: 15),
  child: Column(
    children: <Widget>[

    Container(
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.centerLeft,
      child: Text(nombreCasilla, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ))
    ),

    Container(
      margin: EdgeInsets.only(bottom: 5),
      child:
        Row( 
          children: <Widget>[
            Text('Dirección: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold )),
            Text(direccion)
        ]),
    ),

    Container(
      margin: EdgeInsets.only(bottom: 5),
      child:
        Row( children: <Widget>[
          Text('Ciudad: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold )),
          Text(ciudad)
        ]),
    ),
    
    Row( children: <Widget>[
        Text('Código postal: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold )),
        Text(codigoPostal)
    ])

  ]),
);