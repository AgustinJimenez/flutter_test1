import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app/setup/DatabaseSetup.dart';

class DB
{
  Database _db;
  bool _is_initial = false;

  DB([bool is_initial = false])
  {
    _is_initial = is_initial;
  }

  Future<Database> get db async 
  {
    if( DatabaseSetup.debug )
      print( "GET-DB-RUNNING...\n");

    if( _db != null )
      return _db;

    _db = await initDb();

    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async 
  {
    if( DatabaseSetup.debug )
      print( "INIT-DB-RUNNING...\n");

    String databasesPath = await getDatabasesPath();
    
    String path = join(databasesPath, DatabaseSetup.name );

    if( _is_initial && DatabaseSetup.delete_db_before )
    {
      if( DatabaseSetup.debug )
        print( "DELETING DB BEFORE...\n");

      // Delete the database
      await deleteDatabase(path);
    }

    if( DatabaseSetup.debug )
      print( "DB-PATH=$path \n");

    var db = await openDatabase(path, version: DatabaseSetup.version, onCreate: _onCreate );

    return db;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int newVersion) async 
  {
    String ddl = DatabaseSetup.ddl.join();

    if( DatabaseSetup.debug )
      print( "CREATING-DB...\nSQL=($ddl)\n");

    await db.execute( ddl );
  }

}