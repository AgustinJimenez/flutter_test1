import 'package:flutter/material.dart';

class PBoxLoginPage extends StatefulWidget 
{
  @override
  PBoxLoginPageState createState() 
  {
    return PBoxLoginPageState();
  }
}

class PBoxLoginPageState extends State<PBoxLoginPage>
{
  Map _formsStates = 
  {
    "username": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
  };


  double _screenWidth;
  bool _debug = false;
  @override
  Widget build(BuildContext context) 
  {
    _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold
    (
      body: SafeArea
      (
        child: Container
        (
          child: _renderContent(),
          decoration: new BoxDecoration(color: (_debug?Colors.red:null) ),
        ),
      )
    );
  }




  ListView _renderContent() => ListView
  (

    padding: EdgeInsets.only( right: _screenWidth*0.07, left: _screenWidth*0.07 ),  
    children: <Widget>
    [_renderLogo()]+
    _renderInputs()+
    [_renderSaveButtom()]+
    _renderOptions()
    

  );

  Container _renderLogo() => Container
  (
    padding: EdgeInsets.only
    (
      left: _screenWidth*0.1,
      top: _screenWidth*0.2,
      right: _screenWidth*0.1,
      bottom: _screenWidth*0.1,

    ),
    child: Image
    (
      image: AssetImage('assets/images/puntoboxdark.png'),
    ),

  );
  
  _renderInputs() => <Widget>
  [
    
    Form
    (
      key: _formsStates['username'],
      child: TextFormField
      (
        validator: (value)
        {
          if( value.isEmpty )
            return "El campo es requerido";
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration
        (
          hintText: 'Email',
          labelText: 'Email:',
        )
      )
    ),
    Container
    (
      margin: EdgeInsets.only( top: _screenWidth*0.06 ),
      child: Form
      (
        key: _formsStates['password'],
        child: TextFormField
        (
          obscureText: true,
          validator: (value)
          {
            if( value.isEmpty )
              return "El campo es requerido";
          },
          keyboardType: TextInputType.text, // Use email input type for emails.
          decoration: InputDecoration
          (
            
            hintText: 'Contraseña',
            labelText: 'Contraseña:',
          )
        )
      )
    )
  ];

  Container _renderSaveButtom() => Container
  (

    height: _screenWidth*0.12,
    child: RaisedButton
    (
      child: Text
      (
        'Iniciar Sesión',
        style: TextStyle
        (
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
      onPressed: () 
      {
        _formsStates.forEach((key, formState)
        {

            if( formState.currentState.validate() ) 
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
        });
      
      },

    ),
    margin: EdgeInsets.only( top: _screenWidth*0.06 ),
  );
  
  _renderOptions() => <Widget>
  [
    Container
    (
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only( top: _screenWidth*0.05 ),
      child: Text("Crear Cuenta", style: TextStyle(fontSize: 16) ),
    ),
    Container
    (
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only( top: _screenWidth*0.03 ),
      child: Text("¿Olvidó su contraseña?", style: TextStyle(fontSize: 16) ),
    ),
  ];
}

