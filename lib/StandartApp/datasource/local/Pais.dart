import 'package:sqflite/sqflite.dart';
import 'package:app/providers/DB.dart';

String table = "paises";

class Pais 
{
  Pais();
  int id;
  String nombre;

  Map<String, dynamic> toMap() =>
  {
    "id": id,
    "nombre": nombre
  };

  Pais fromMap(Map<String, dynamic> map) 
  {
    id = map['id'];
    nombre = map['nombre'];

    return this;
  }

  Future<dynamic> save() async
  {
    int updated = 0;

    await _openDb();

    if( this.id == null)
    {
      this.id = await _db.insert(table, this.toMap() );
      await _closeDb();
      return this;
    }
    else
    {
      updated = await _db.update(table, this.toMap(), where: "id = ?", whereArgs: [this.id]);
      await _closeDb();
      return updated;
    }
  }

  Future<int> delete() async
  {
    await _openDb();
    
    int deleted = 0;

    deleted = await _db.delete(table, where: "id = ?", whereArgs: [id]);

    await _closeDb();

    return deleted;
  }

  static Future<Pais> find(int id) async 
  {
    await _openDb();

    List<Map> results = await _db.query(table, where: "id = ?", whereArgs: [id]);

    if( results.length > 0 )
    {
      Pais pais = Pais();
      pais.fromMap( results.first );
      await _closeDb();
      return pais;
    }

    await _closeDb();
    return null;
  }

  static Future<List<Pais>> list() async 
  {
    await _openDb();

    var list = (await _db.query(table)).map( (item) => Pais().fromMap(item) ).toList();

    await _closeDb();

    return list;
  }

  static _openDb() async 
  {
    if( _db==null || !_db.isOpen )
      _db = await DB().db;
  }

  static _closeDb() async 
  {
    if( _db!=null || !_db.isOpen )
      await _db.close();
  }
  static Database _db;
  static bool _debug = true;
}