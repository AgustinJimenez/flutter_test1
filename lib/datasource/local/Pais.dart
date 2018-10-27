import 'package:sqflite/sqflite.dart';

final String table = "paises";
final String columnId = "_id";
final String columnNombre = "nombre";

class Pais 
{
  int id;
  String nombre;

  Pais();

  Map<String, dynamic> toMap() 
  {
    var map = <String, dynamic>
    {
      columnNombre: nombre
    };

    if (id != null) 
      map[columnId] = id;
      
    return map;
  }

  Pais.fromMap(Map<String, dynamic> map) 
  {
    id = map[columnId];
    nombre = map[columnNombre];
  }
}

class PaisProvider 
{
  Database db;

  Future open(String path) async 
  {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async 
        {
        await db.execute
        ('''
          create table $table ( 
          $columnId integer primary key autoincrement, 
          $columnNombre text not null
        ''');
    });
  }

  Future<Pais> insert(Pais item) async 
  {
    item.id = await db.insert(table, item.toMap());
    return item;
  }

  Future<Pais> find(int id) async 
  {
    List<Map> results = await db.query(table, columns: [columnId, columnNombre], where: "$columnId = ?", whereArgs: [id]);

    if( results.length > 0 )
      return new Pais.fromMap( results.first );

    return null;
  }

  Future<int> delete(int id) async => await db.delete(table, where: "$columnId = ?", whereArgs: [id]);
  Future<int> update(Pais item) async => await db.update(table, item.toMap(), where: "$columnId = ?", whereArgs: [item.id]);
  Future close() async => db.close();
}