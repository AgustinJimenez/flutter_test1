
import 'package:app/pages/HomePage.dart';
import 'package:app/pages/AlbumPage.dart';
import 'package:app/pages/personas/PersonasIndex.dart';
import 'package:app/pages/paises/index.dart';
import 'package:app/pages/PuntoBox/PBoxLogin/PBoxLoginPage.dart';
import 'package:app/pages/PuntoBox/PBoxDashboard/PBoxDashboardPage.dart';
class AppRoutes
{
  static Object routes = 
  {
    '/': (context) => HomePage(),
    'albums': (context) => AlbumPage(),
    'personas': (context) => PersonasIndex(),
    'paises': (context) => PaisesIndex(),
    'login': (context) => PBoxLoginPage(),
    'dashboard': (context) => PBoxDashboardPage()

  };
  static String initialRoute = 'dashboard';
}