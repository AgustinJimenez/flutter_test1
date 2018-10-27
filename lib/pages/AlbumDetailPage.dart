import 'package:flutter/material.dart';
import 'package:app/datasource/Album.dart';
import 'package:app/components/CardOne.dart';
class AlbumDetailPage extends StatefulWidget 
{
  Album _album;

  AlbumDetailPage(Album album)
  {
    this._album = album;
  }

  @override
  AlbumDetailPageState createState() {
    return new AlbumDetailPageState();
  }
}

class AlbumDetailPageState extends State<AlbumDetailPage> {
  String _page_title = "Detalle Album";

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text( _page_title ),
      ),
      body: CardOne(),
    );
  }
}