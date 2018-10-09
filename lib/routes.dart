import './pages/HomePage.dart';
import './pages/AlbumPage.dart';

class AppRoutes
{
  static Object routes = 
  {
    '/': (context) => HomePage(),
    'albums': (context) => AlbumPage(),
  };
  static String initialRoute = '/';
}