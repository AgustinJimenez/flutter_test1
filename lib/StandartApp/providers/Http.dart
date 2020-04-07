import 'dart:core';

import 'package:http/http.dart' as http;
import "../setup/HttpSetup.dart";
import 'dart:convert';

class Http 
{
  static bool _debug = true;

  static dynamic request
  (
    String url, 
    [
      Map args = const {}, 
      String type = "GET", 
      Map < String, dynamic > options = const { 'headers': {}, 'timeout': 15 }, 
      String dataType = "json"
    ]
  ) 
  async
  {
    var newHeader = HttpSetup.defaultHeaders;
    int newTimeout = HttpSetup.default_timeout;

    if( _debug )
      print("<=== ============================HTTP-START (${(new DateTime.now().toString())})===================================== ===>");

    type = type.toUpperCase();

    newHeader.addAll( new Map<String, String>.from( options['headers'] ) );

    if( options['timeout'] != null )
      newTimeout = options['timeout'];

    if( _debug )
      print( "SENDING===>\n(\nurl="+url+", \nargs="+args.toString()+", \ntype="+type+", \ntimeout="+newTimeout.toString()+" seconds, \nheaders="+newHeader.toString()+"\n)\n " );

    http.Response response;

    if( type == "GET")
      response = await http
      .get(url, headers: newHeader)
      .timeout( Duration(seconds: newTimeout) );

    else if( type == "POST" || type == "PUT" || type == "PATCH" )
      response = await http
      .post(url, headers: newHeader, body: args)
      .timeout( Duration(seconds: newTimeout) );

    if( _debug )
      print( "RESPONSE===>\n(\n${response.body.toString()})\n)" );

    if( _debug )
      print("<=== ============================HTTP-END (${(new DateTime.now().toString())})===================================== ===>");

    if( dataType == 'response')
        return response;
        
    if( response.statusCode == 200 )
      if( dataType == 'json')
        return json.decode(response.body);
      else
        return response;
    else
      throw Exception('Failed to load requet');
      
  }
}
