import 'package:http/http.dart' as http;
import "package:app/setup/DefaultHttpHeaders.dart";
import 'dart:convert';

class Http 
{
  static bool debug = false;

  static dynamic request(String url, [Map args = const {}, String type="GET", Map<String, String> headers = const {}, String data_type = "json"]) async
  {
    if( debug )
      print("<=== ============================HTTP-START===================================== ===>");

    type = type.toUpperCase();
    
    Map<String, String> new_header = DefaultHttpHeaders.values;
    
    new_header.addAll( headers );

    if( debug )
      print( "SENDING===>\n(\nurl=${url}, \nargs=${args.toString()}, \ntype=${type}, \nheaders=${new_header.toString()}\n)\n" );

    var response;

    if( type == "GET")
      response = await http.get(url, headers: new_header);
    else if( type == "POST" || type == "PUT" || type == "PATCH" )
      response = await http.post(url, headers: new_header, body: args);

    if( debug )
      print( "RESPONSE===>\n(\n${response.body.toString()})\n)" );

    if( debug )
      print("<=== ============================HTTP-END===================================== ===>");

    if( data_type == 'response')
        return response;
        
    if( response.statusCode == 200 )
      if( data_type == 'json')
        return json.decode(response.body);
    else 
      throw Exception('Failed to load requet');
  }
}
