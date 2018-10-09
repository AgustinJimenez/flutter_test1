import 'package:flutter/material.dart';
import './setup/Setup.dart';

void main() => runApp(new App());

class App extends StatelessWidget 
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return new Setup();
  }
}
