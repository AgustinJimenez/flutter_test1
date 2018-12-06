import 'package:flutter/material.dart';
import 'package:app/routes.dart';
import 'package:app/providers/DB.dart';
import 'package:app/setup/ThemeSetup.dart';

class Setup extends StatelessWidget 
{
  bool _debug = true;

  Setup()
  {
    if( _debug )
      print("<=== RUNNING-SETUP ===>");

    DB(true).initDb();
    
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
      theme: ThemeSetup().get_theme(),
    );
  }
}