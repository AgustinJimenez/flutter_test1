import 'package:flutter/material.dart';

renderNoEncuentroPaqueteInput() =>
  Form(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin:EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(204, 215, 233, 1),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(5), right: Radius.circular(5)),
      ),
      child: TextFormField(
        validator: (value) => (value.isEmpty) ? "El nombre es requerido" : null,
        onSaved: (String value) => {},
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 22),
          labelStyle: TextStyle(fontSize: 18),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          hintText: 'Buscar paquete por número de tracking',
          labelText: 'Buscar paquete por número de tracking:',
        )
      )
    ),
  );