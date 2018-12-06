import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/datasource/local/Pais.dart';

Pais _pais;

class PaisesForm extends StatefulWidget 
{
  PaisesForm([Pais pais])
  {
    _pais = ( pais == null ) ? Pais() : pais;
  }

  @override
  PaisesFormState createState() => PaisesFormState();
}


class PaisesFormState extends State<PaisesForm>
{
  String _title = "Crear Pais";
  Map _forms_states = 
  {
    "nombre": GlobalKey<FormState>()
  };

  @override
  Widget build(BuildContext context) => Scaffold
  (
    appBar: AppBar
    (
      title: Text( _pais.id==null?'CREAR PAIS':"ACTUALIZAR PAIS" )
    ),
    body: Builder
    ( 
      builder: (context) =>
      Container
      (
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListView
        (
          children: <Widget>
          [
            Form
            (
              key: _forms_states['nombre'],
              child: TextFormField
              (
                autofocus: true,
                initialValue: _pais.nombre,
                validator: (value) => (value.isEmpty) ? "El nombre es requerido" : null,
                onSaved: (String value) => _pais.nombre = value,
                keyboardType: TextInputType.text, // Use email input type for emails.
                decoration: InputDecoration
                (
                  hintText: 'Nombre',
                  labelText: 'Nombre:',
                )
              )
            ),
            
            Container
            (
              width: MediaQuery.of(context).size.width,
              child: RaisedButton
              (
                child: Text
                (
                  _pais.id==null?'GUARDAR':"ACTUALIZAR",
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async
                {
                  bool is_valid = true;

                  _forms_states.forEach((key, form_state)
                  {
                    is_valid = form_state.currentState.validate();
                    if( is_valid )
                      form_state.currentState.save(); 
                  });

                  if( is_valid )
                  {
                    //Pais.create(  );
                    Fluttertoast.showToast
                    (
                      msg: "El pais se guardo correctamente.",
                      toastLength: Toast.LENGTH_SHORT,
                    );

                    await _pais.save();

                    Navigator.of(context).pop();
                  }
                    
                },
                color: Colors.blue,
              ),
              margin: EdgeInsets.only( top: 20.0 ),
            )
          ]
        )      
      )
    ) 
  );
}
