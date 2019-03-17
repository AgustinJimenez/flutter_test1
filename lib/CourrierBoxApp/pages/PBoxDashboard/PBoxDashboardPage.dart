import 'package:flutter/material.dart';
import 'package:app/components/Buttons/TouchableOpacity.dart';

class PBoxDashboardPage extends StatefulWidget 
{
  @override
  PBoxDashboardPageState createState() 
  {
    return PBoxDashboardPageState();
  }
}

class PBoxDashboardPageState extends State<PBoxDashboardPage>{

  _renderBienvenido() => 
    Container(
      margin: EdgeInsets.only(top: 15, bottom: 10), 
      child: 
        Row(
          children: <Widget>[
            Expanded(
              child: Text('Bienvenido Agustin - PB1180!', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            )
          ]
        )
    );
  _renderTopBar() => 
    Container(height: 50, padding: EdgeInsets.only(left: 10, right: 10), color: Color.fromRGBO(35, 47, 62, 1.0), 
      child: 
        Row(
          children: <Widget>[
            Expanded(
              child: Text('Salir', style: TextStyle(color: Colors.white, fontSize: 20))
            ),
            Expanded(
              child: Container(
                child: Image
                (
                  image: AssetImage('assets/images/puntobox.png'),
                ),
              )
            ),
            Expanded(
              child: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.right)
            ),
          ],
        )
    );

  _renderOrangeBox({String title: '', String value: '0', double mTop: 5, double mRight: 0, double mBottom: 5, double mLeft: 0}) =>
    GestureDetector(
      onTap: (){

      },
      onTapDown: (TapDownDetails details){ 

      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(title, style: TextStyle( fontSize: 20) ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(value, style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold) ),
            )
          ]
        ),
        height: 80,
        width: 200,
        margin: EdgeInsets.only(top:mTop, right: mRight, bottom: mBottom, left: mLeft),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(255, 153, 0, 1)),
          color: Color.fromRGBO(255, 229, 210, 1),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(5), right: Radius.circular(5))
        ),
      )
    );
 

  _renderNoEncuentroPaqueteInput() =>
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

  _renderTusPaquetes() =>
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
            Expanded(child: _renderOrangeBox(title: 'En origen', mRight: 5) ),
            Expanded(child: _renderOrangeBox(title: 'En tránsito', mLeft: 5) )
          ]
        )
      ),
      Container(
        child: Row(
          children: <Widget>[
            Expanded(child: _renderOrangeBox(title: "En sucursal", mRight: 5) ),
            Expanded(child: _renderOrangeBox(title: "Entregados", mLeft: 5) )
          ]
        )
      )
    ]);

  _renderContent() => 
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>
        [
          _renderBienvenido(),
          _renderTusPaquetes(),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 5),
            child: Text('Estado de cuenta', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold )) 
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text('Pendiente de pago: Gs. 0', textAlign: TextAlign.center, style: TextStyle(fontSize: 18 ))
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text('No encuentro mi paquete', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold )) 
          ),
          _renderNoEncuentroPaqueteInput(),
          MaterialButton(
            onPressed: () {},
            textColor: Colors.white,
            height: 45,
            color: Color.fromRGBO(255,153,0, 1),
            elevation: 3,
            minWidth: double.infinity,
            child: Text('Guardar', style:TextStyle(fontSize: 20))
          ),
          Container(
            height: 50,
          )

        ]
      )
    );
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: _renderTopBar(),
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(35, 47, 62, 1.0),
        actions: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text('Salir' ,style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ),
          Expanded(
            child: Container(
              child: Image
              (
                image: AssetImage('assets/images/puntobox.png'),
              ),
            )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center)
            )
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            _renderContent()
          ],),
      ),
      )
    );

  }


  
}