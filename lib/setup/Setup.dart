import 'package:flutter/material.dart';
import 'package:app/routes.dart';

class Setup extends StatelessWidget 
{

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