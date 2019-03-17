import '../pages/PBoxDashboard/PBoxDashboardPage.dart';
import '../pages/PBoxLogin/PBoxLoginPage.dart';

RouterSetup() => {
  'initialRoute': (context) => PBoxDashboardPage(),
  'login': (context) => PBoxLoginPage(),
  'dashboard': (context) => PBoxDashboardPage(),
};