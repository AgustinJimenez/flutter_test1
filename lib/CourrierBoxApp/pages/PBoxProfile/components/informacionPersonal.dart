import 'package:flutter/material.dart';

Container renderInformacionPersonal(
        {nombre: '',
        apellido: '',
        email: '',
        tipoDocumento: '',
        nroDocumento: '',
        fechaNacimiento: '',
        genero: '',
        telefono: ''}) =>
    Container(
        margin: EdgeInsets.only(left: 15, top: 15),
        child: Column(
            children: //[Container(), Container()]
                items([
          {"title": 'Nombre: ', "value": nombre},
          {"title": 'Apellido: ', "value": apellido},
          {"title": 'Email: ', "value": email},
          {"title": 'Tipo de documento: ', "value": tipoDocumento},
          {"title": 'Número de documento: ', "value": nroDocumento},
          {"title": 'Fecha de nacimiento: ', "value": fechaNacimiento},
          {"title": 'Género: ', "value": genero},
          {"title": 'Teléfono: ', "value": telefono}
        ])));

List<Container> items(List<Map<String, String>> items) => items
    .map((item) => Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Row(children: <Widget>[
          Text(item['title'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(item['value'])
        ])))
    .toList();
