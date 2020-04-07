
import './pages/HomePage.dart';
import './pages/albums/AlbumIndex.dart';
import './pages/personas/PersonasIndex.dart';
import './pages/paises/PaisesIndex.dart';
//import './pages/PuntoBox/PBoxLogin/PBoxLoginPage.dart';
//import './pages/PuntoBox/PBoxDashboard/PBoxDashboardPage.dart';
class AppRoutes
{
  static Object routes = 
  {
    '/': (context) => HomePage(),
    'albums': (context) => AlbumIndex(),
    'personas': (context) => PersonasIndex(),
    'paises': (context) => PaisesIndex(),
    //'login': (context) => PBoxLoginPage(),
    //'dashboard': (context) => PBoxDashboardPage()

  };
  static String initialRoute = '/';
}