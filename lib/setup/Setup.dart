import 'package:flutter/material.dart';
import './../routes.dart';

class Setup extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}