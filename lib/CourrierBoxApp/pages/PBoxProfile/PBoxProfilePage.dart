import 'package:flutter/material.dart';
import '../../custom_widgets/CustomAppBar.dart';
import '../../custom_widgets/CustomContentContainer.dart';

class PBoxProfilePage extends StatefulWidget 
{
  @override
  PBoxProfilePageState createState() 
  {
    return PBoxProfilePageState();
  }
}

class PBoxProfilePageState extends State<PBoxProfilePage>{

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: CustomAppBar( ctx: context, leftItem: 'Salir', rightItem: false, centerItem: 'Perfil' ),
      body: CustomContentContainer([

      ]),
    );

  


  
}