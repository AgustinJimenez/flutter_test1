import 'package:flutter/material.dart';
import '../components/Drawer/SideDrawer.dart';
class HomePage extends StatelessWidget
{
  final String page_title = "Home Page";

  @override
  Widget build(BuildContext context) 
  {
    return //BaseScaffold
    Scaffold
    (
      drawer: SideDrawer(),
      appBar: AppBar
      ( 
        title: Text( page_title )
      ),
      body: Center
      (
        child: Text("This is Home Page", style: TextStyle( fontSize: 35.0 ) )
      )
    );
  }
}