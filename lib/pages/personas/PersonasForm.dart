import 'package:flutter/material.dart';

class PersonasForm extends StatefulWidget 
{
  @override
  PersonasFormState createState() 
  {
      return PersonasFormState();
  }
}


class PersonasFormState extends State<PersonasForm>
{
  String _title = "Crear Persona";
  Map _forms_states = 
  {
    "nombre": GlobalKey<FormState>(),
    "apellido": GlobalKey<FormState>(),
    "direccion": GlobalKey<FormState>(),
    "cedula": GlobalKey<FormState>(),
    "email": GlobalKey<FormState>()
  };

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text( _title )
      ),
      body: Container
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
                validator: (value)
                {
                  if( value.isEmpty )
                    return "El nombre es requerido";
                },
                keyboardType: TextInputType.text, // Use email input type for emails.
                decoration: InputDecoration
                (
                  hintText: 'Nombre',
                  labelText: 'Nombre:',
                )
              )
            ),
            Form
            (
              key: _forms_states["apellido"],
              child:
              TextFormField
              (
                validator: (value)
                {
                  if( value.isEmpty )
                    return "El apellido es requerido";
                },
                keyboardType: TextInputType.text, 
                decoration: InputDecoration
                (
                  hintText: 'Apellido',
                  labelText: 'Apellido:',
                )
              )
            ),
            Form
            (
              key: _forms_states["direccion"],
              child: TextFormField
              ( 
                validator: (value)
                {
                  if( value.isEmpty )
                    return "La Dirección es requerido";
                },
                decoration: InputDecoration
                (
                  hintText: 'Dirección',
                  labelText: 'Dirección:',
                )
              ),
            ),
            Form
            (
              key: _forms_states["cedula"],
              child: TextFormField
              (
                validator: (value)
                {
                  if( value.isEmpty )
                    return "La cedula es requerida";
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration
                (
                  hintText: 'C.I',
                  labelText: 'C.I:',
                )
              ),
            ),
            Form
            (
              key: _forms_states["email"],
              child: TextFormField
              (
                validator: (value)
                {
                  if( value.isEmpty )
                    return "El email es requerido";
                },
                keyboardType: TextInputType.emailAddress, 
                decoration: InputDecoration
                (
                  hintText: 'E-Mail',
                  labelText: 'E-Mail:',
                )
              ),
            ),
            Container
            (
              width: MediaQuery.of(context).size.width,
              child: RaisedButton
              (
                child: Text
                (
                  'GUARDAR',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () 
                {
                  _forms_states.forEach((key, form_state)
                  {

                      if( form_state.currentState.validate() ) 
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  });
                
                },
                color: Colors.blue,
              ),
              margin: EdgeInsets.only( top: 20.0 ),
            )
          ]
        )      
      )
    );
  }
  
}
