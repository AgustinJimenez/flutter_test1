import 'package:flutter/material.dart';
import 'package:app/routes.dart';
import './SQLiteDB.dart';
class Setup extends StatelessWidget 
{
  Setup()
  {
    print("<=== RUNNING-SETUP ===>");

    var a = new SQLiteDB();
    var tmp = a.db;
    
  }

  @override
  Widget build(BuildContext context) 
  {

    return MaterialApp
    (
      title: "Flutter Test 1",
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      color: Colors.red,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      theme: new ThemeData
      (
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),

    );
  }
}