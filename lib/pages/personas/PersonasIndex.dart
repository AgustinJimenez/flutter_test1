import 'package:flutter/material.dart';
import 'package:app/components/Drawer/SideDrawer.dart';
import './PersonasForm.dart';
class PersonasIndex extends StatelessWidget 
{
  String _title = "Indice Personas";
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
            builder: (context) => PersonasForm()
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