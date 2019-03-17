import 'package:flutter/material.dart';
import './ThemeSetup.dart';
import './RouterSetup.dart';

class Setup extends StatelessWidget 
{
  bool _debug = true;

  Setup()
  {
    
  }

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: "CourrierBox App",
      initialRoute: RouterSetup()['initialRoute'],
      routes: RouterSetup(),
      color: Colors.red,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      theme: ThemeSetup(),
    );
  }
}