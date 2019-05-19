import 'package:flutter/material.dart';
import '../../custom_widgets/CustomAppBar.dart';
import '../../custom_widgets/CustomContentContainer.dart';
import 'components/datosDeTuCasilla.dart';
import 'components/informacionPersonal.dart';

class PBoxProfilePage extends StatefulWidget {
  @override
  PBoxProfilePageState createState() {
    return PBoxProfilePageState();
  }
}

class PBoxProfilePageState extends State<PBoxProfilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(
            ctx: context,
            leftItem: 'Salir',
            rightItem: false,
            centerItem: 'Mi Perfil'),
        body: CustomContentContainer([
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Text('Datos de tu Casilla',
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center)),
          renderDatosDeTuCasilla(
              nombreCasilla: 'Agustin - PB1180',
              direccion: '8429 NW 74 TH Street',
              ciudad: 'MIAMI, FLORIDA',
              codigoPostal: '33166-6220'),
          Container(
            height: 1,
            color: Colors.black12,
            margin: EdgeInsets.only(top: 15, right: 15, left: 15),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Text('Datos de tu Cuenta',
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center)),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('Información personal',
                style: Theme.of(context).textTheme.subhead),
          ),
          renderInformacionPersonal(
              nombre: 'John',
              apellido: 'Doe',
              email: 'john.doe@gmail.com',
              tipoDocumento: 'Cédula de identidad',
              nroDocumento: '111111',
              fechaNacimiento: '13/01/1983',
              genero: 'Masculino',
              telefono: '+595111111')
        ], padding: false),
      );
}
