import 'package:sqflite/sqflite.dart';

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


    if( this.id == null)
    {
      this.id = await _db.insert(table, this.toMap() );
      return this;
    }
    else
    {
      updated = await _db.update(table, this.toMap(), where: "id = ?", whereArgs: [this.id]);
      return updated;
    }
  }

  Future<int> delete() async
  {
    
    int deleted = 0;

    deleted = await _db.delete(table, where: "id = ?", whereArgs: [id]);

    return deleted;
  }

  static Future<Pais> find(int id) async 
  {

    List<Map> results = await _db.query(table, where: "id = ?", whereArgs: [id]);

    if( results.length > 0 )
    {
      Pais pais = Pais();
      pais.fromMap( results.first );
      return pais;
    }

    return null;
  }

  static Future<List<Pais>> list() async 
  {

    var list = (await _db.query(table)).map( (item) => Pais().fromMap(item) ).toList();


    return list;
  }
  static Database _db;
  static bool _debug = true;
}