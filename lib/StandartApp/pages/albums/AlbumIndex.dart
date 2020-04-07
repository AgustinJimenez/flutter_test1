import 'dart:async';


import 'package:flutter/material.dart';

import '../../datasource/Album.dart';
import '../../components/Drawer/SideDrawer.dart';
import './AlbumDetailPage.dart';
import '../../providers/Http.dart';

class AlbumIndex extends StatelessWidget 
{
  final String _apiEndpoint = 'https://jsonplaceholder.typicode.com/albums';
  final String _pageTitle = "Albums";

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      drawer: SideDrawer(),
      appBar: AppBar
      (
        title: Text( _pageTitle )
      ),
      body: Center
      (
        child: FutureBuilder<List<Album>>
        (
          future: fetchAlbum( _apiEndpoint ),

          builder: (context, snapshot)
          {
            //Text( snapshot.data.title )
            //snapshot.data[index].title
            if( snapshot.hasData )
              return ListView.builder
              (
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) 
                {
                  return ListTile
                  (
                    trailing: Icon( Icons.arrow_right ),
                    title: Text( snapshot.data[index].title ),
                    onTap: () => Navigator.of(context).push
                    (
                      MaterialPageRoute
                      (
                        builder: (context) => AlbumDetailPage( snapshot.data[index] )
                      )
                    ),
                    
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


Future< List<Album> > fetchAlbum( source ) async 
{
  var result = await Http.request( source );

  var list_of_albums = (result as List).map( (album_json) => Album.fromJson( album_json )).toList();

  return list_of_albums;
}