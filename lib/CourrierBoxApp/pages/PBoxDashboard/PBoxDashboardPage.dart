import 'package:flutter/material.dart';
import '../../custom_widgets/CustomAppBar.dart';
import './components/tusPaquetes.dart';
import './components/noEncuentroMisPaquetes.dart';
import './components/bienvenido.dart';
class PBoxDashboardPage extends StatefulWidget 
{
  @override
  PBoxDashboardPageState createState() 
  {
    return PBoxDashboardPageState();
  }
}

class PBoxDashboardPageState extends State<PBoxDashboardPage>{

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>
                [
                  renderBienvenido('Bienvenido Agustin - PB1180!'),
                  renderTusPaquetes(enOrigen: 0, enTransito: 0, enSucursal: 0, entregados: 0),
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
                  renderNoEncuentroPaqueteInput(),
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
            )
          ])
        )
      )
    );

  


  
}