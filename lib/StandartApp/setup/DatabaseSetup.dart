class DatabaseSetup 
{
  static bool debug = true;
  static bool deleteDbBefore = false;
  static String name = "test.db";
  static int version = 1;
  static List<String> ddl = 
  [
    'CREATE TABLE IF NOT EXISTS paises(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL );'
  ];

}