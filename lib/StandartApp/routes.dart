
import './pages/HomePage.dart';
import './pages/AlbumPage.dart';
import './pages/personas/PersonasIndex.dart';
import './pages/paises/index.dart';
import './pages/PuntoBox/PBoxLogin/PBoxLoginPage.dart';
import './pages/PuntoBox/PBoxDashboard/PBoxDashboardPage.dart';
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