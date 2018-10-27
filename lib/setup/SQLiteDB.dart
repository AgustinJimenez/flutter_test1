import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class SQLiteDB
{
  static Database _db;
  static bool _debug = true;

  Future<Database> get db async 
  {
    if( _debug )
      print( "GET-DB-RUNNING...\n");
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async 
  {
    if( _debug )
      print( "INIT-DB-RUNNING...\n");

    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    if( _debug )
      print( "DB-PATH=$path\n");
      
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async 
  {
    // When creating the db, create the table
    String sql = 
    'CREATE TABLE paises(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL )'+
    ''+
    ''+
    ''+
    ''+
    ''
    ;

    if( _debug )
    {
      print( "CREATING-DB...\n");
      print( "$sql\n");
    }
      

    await db.execute(sql);
  }

}