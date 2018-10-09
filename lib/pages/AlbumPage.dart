import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './../datasource/Album.dart';

class AlbumPage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text( "Products" ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center
      (
        child: FutureBuilder<List<Album>>
        (
          future: fetchAlbum(),

          builder: (context, snapshot)
          {
            //Text( snapshot.data.title )
            if( snapshot.hasData )
              return ListView.builder
              (
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) 
                {
                  return Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(snapshot.data[index].title, style: TextStyle(fontWeight: FontWeight.bold) ),
                      Divider(),
                    ]

                  );
                }
              );
            else if( snapshot.hasError )
              return Text("${snapshot.error}");

              return CircularProgressIndicator();
          }
        )
      )
    );
  }
}


Future< List<Album> > fetchAlbum() async 
{
  final response = await http.get('https://jsonplaceholder.typicode.com/albums');

  var listOfAlbums = (json.decode(response.body) as List).map( (e) => Album.fromJson( e )).toList();

  if( response.statusCode == 200 )
    return listOfAlbums;
  else 
    throw Exception('Failed to load post');
}