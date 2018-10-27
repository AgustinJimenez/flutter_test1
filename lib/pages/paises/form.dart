import 'package:flutter/material.dart';

class PaisesForm extends StatefulWidget 
{
  @override
  PaisesFormState createState() 
  {
      return PaisesFormState();
  }
}


class PaisesFormState extends State<PaisesForm>
{
  String _title = "Crear Pais";
  Map _forms_states = 
  {
    "nombre": GlobalKey<FormState>()
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
