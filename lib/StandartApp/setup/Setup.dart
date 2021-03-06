import 'package:flutter/material.dart';
import './ThemeSetup.dart';
import './RouterSetup.dart';
import '../routes.dart';

Setup() => MaterialApp(
      title: "CourrierBox App",
      theme: ThemeSetup(),
      routes: RouterSetup(),
      initialRoute: AppRoutes.initialRoute,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      //locale: Locale('es'),

      //home: Text("Hello World"),
    );
