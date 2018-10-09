import 'package:flutter/material.dart';
import './../components/Drawer/SideDrawer.dart';

class HomePage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: new AppBar
      ( 
        title: new Text("Home Page"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Center
      (
        child: new Text("This is Home Page", style: new TextStyle( fontSize: 35.0 ) )
      ),
      drawer: new SideDrawer()
    );
  }
}