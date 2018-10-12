import 'package:flutter/material.dart';
import 'package:app/components/Drawer/SideDrawer.dart';
import 'package:app/datasource/Album.dart';

class AlbumDetailPage extends StatelessWidget 
{
  Album album;

  AlbumDetailPage(Album album)
  {
    this.album = album;
  }
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      drawer: SideDrawer(),
      body: Container
      (
        child: Center
        (
          child: Text( album.title ),
        ),
      ),
    );
  }

}