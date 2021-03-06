import 'package:flutter/material.dart';
import './categoriasPaquetes.dart';

renderTusPaquetes({int enOrigen = 0, int enTransito = 0, int enSucursal = 0, int entregados = 0}) =>
  Column(children: <Widget>[
    Container(
      margin: EdgeInsets.only(top: 20, bottom: 10), child: 
      Row(
        children: <Widget>[
          Expanded(
            child: Text('Tus paquetes', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          )
        ]
      )
    ),

    Container(
      child: Row(
        children: <Widget>[
          Expanded( child: renderCategoriasPaquetes(title: 'En origen', value: enOrigen, mRight: 5, onTapDown: enOrigenWasPressed )),
          Expanded( child: renderCategoriasPaquetes(title: 'En tránsito', value: enTransito, mLeft: 5, onTapDown: enTransitoWasPressed ))
        ]
      )
    ),
    Container(
      child: Row(
        children: <Widget>[
          Expanded(child: renderCategoriasPaquetes(title: "En sucursal", value: enSucursal, mRight: 5, onTapDown: enSucursalWasPressed )),
          Expanded(child: renderCategoriasPaquetes(title: "Entregados", value: entregados, mLeft: 5, onTapDown: enEntregadosWasPressed ))
        ]
      )
    )
  ]);

VoidCallback enOrigenWasPressed(TapDownDetails d){

  print('enOrigenWasPressed!!!');

}

VoidCallback enTransitoWasPressed(TapDownDetails d){

  print('enTransitoWasPressed!!!');

}
VoidCallback enSucursalWasPressed(TapDownDetails d){

  print('enSucursalWasPressed!!!');

}
VoidCallback enEntregadosWasPressed(TapDownDetails d){

  print('enEntregadosWasPressed!!!');

}
