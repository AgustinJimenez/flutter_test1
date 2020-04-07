import 'package:flutter/material.dart';
import '../../datasource/Album.dart';
import '../../components/CardOne.dart';
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
  String _pageTitle = "Detalle Album";

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text( _pageTitle ),
      ),
      body: CardOne(),
    );
  }
}