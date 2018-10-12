
import 'package:app/pages/HomePage.dart';
import 'package:app/pages/AlbumPage.dart';

class AppRoutes
{
  static Object routes = 
  {
    '/': (context) => HomePage(),
    'albums': (context) => AlbumPage()
  };
  static String initialRoute = '/';
}