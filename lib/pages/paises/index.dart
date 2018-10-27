import 'package:flutter/material.dart';
import 'package:app/components/Drawer/SideDrawer.dart';
import './form.dart';


class PaisesIndex extends StatefulWidget 
{
  @override
  PaisesIndexState createState() 
  {
    return PaisesIndexState();
  }
}

class PaisesIndexState extends State<PaisesIndex> 
{
  String _title = "Indice Paises";

  @override
  Widget build(BuildContext context) 
  {


    return Scaffold
    (
      drawer: SideDrawer(),
      appBar: AppBar
      (
        title: Text( _title )
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: () => Navigator.of(context).push
        (
          MaterialPageRoute
          (
            builder: (context) => PaisesForm()
          )
        ),
        elevation: 0.0,
        child: new Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      
      body: Container
      (
        child: Column
        (
          children: <Widget>
          [

          ],
          
        )
      ),
    );
  }
}