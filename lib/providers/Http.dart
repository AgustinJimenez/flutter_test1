import 'dart:core';

import 'package:http/http.dart' as http;
import "package:app/setup/DefaultHttpHeaders.dart";
import 'dart:convert';

class Http 
{
  static bool _debug = true;
  static const  int _default_timeout =  5;

  static dynamic request
  (
    String url, 
    [
      Map args = const {}, 
      String type = "GET", 
      Map < String, dynamic > options = const { 'headers': {}, 'timeout': 15 }, 
      String data_type = "json"
    ]
  ) 
  async
  {
    var new_header = DefaultHttpHeaders.values;
    int new_timeout = _default_timeout;

    if( _debug )
      print("<=== ============================HTTP-START (${(new DateTime.now().toString())})===================================== ===>");

    type = type.toUpperCase();

    new_header.addAll( new Map<String, String>.from( options['headers'] ) );

    if( options['timeout'] != null )
      new_timeout = options['timeout'];

    if( _debug )
      print( "SENDING===>\n(\nurl=${url}, \nargs=${args.toString()}, \ntype=${type}, \ntimeout=${new_timeout.toString()} seconds, \nheaders=${new_header.toString()}\n)\n " );

    http.Response response;

    if( type == "GET")
      response = await http
      .get(url, headers: new_header)
      .timeout( Duration(seconds: new_timeout) );

    else if( type == "POST" || type == "PUT" || type == "PATCH" )
      response = await http
      .post(url, headers: new_header, body: args)
      .timeout( Duration(seconds: new_timeout) );

    if( _debug )
      print( "RESPONSE===>\n(\n${response.body.toString()})\n)" );

    if( _debug )
      print("<=== ============================HTTP-END (${(new DateTime.now().toString())})===================================== ===>");

    if( data_type == 'response')
        return response;
        
    if( response.statusCode == 200 )
      if( data_type == 'json')
        return json.decode(response.body);
      else
        return response;
    else
      throw Exception('Failed to load requet');
      
  }
}
