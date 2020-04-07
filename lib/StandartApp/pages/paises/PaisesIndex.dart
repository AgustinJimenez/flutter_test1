import 'package:flutter/material.dart';
import '../../components/Drawer/SideDrawer.dart';
import './PaisesForm.dart';
import '../../datasource/local/Pais.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import "package:pull_to_refresh/pull_to_refresh.dart";

class PaisesIndex extends StatefulWidget 
{
  @override
  PaisesIndexState createState() => PaisesIndexState();
}

class PaisesIndexState extends State<PaisesIndex> 
{
  String _title = "Indice Paises";
  Future<List<Pais>> _paises;

  @override
  Widget build(BuildContext context)
  {
    _paises = Pais.list();

    return Scaffold
    (
      drawer: SideDrawer(),
      appBar: AppBar
      (
        title: Text( _title )
      ),
      floatingActionButton: _create_buttom_widget(),
      body: _body(),
    );
  }
  FloatingActionButton _create_buttom_widget() => FloatingActionButton
  (
    onPressed: () => Navigator.of(context).push
    (
      MaterialPageRoute
      (
        builder: (context) => PaisesForm()
      )
    ),
    elevation: 0.0,
    child: Icon(Icons.add),
    backgroundColor: Colors.red,
  );

  Container _body() => Container
  (
    child: FutureBuilder<List<Pais>> 
    (
      future: _paises,
      builder: (BuildContext context, AsyncSnapshot snapshot)
      {

        switch( snapshot.connectionState )
        {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            if( snapshot.hasData )
              return _refresable_list_widget(context, snapshot);
            else if( snapshot.hasError )
              return Text("${snapshot.error}");
            return Text('Result: ${snapshot.data}');
        }
        return null;

      }
    )
  );

  RefreshIndicator _refresable_list_widget(context, snapshot) => RefreshIndicator
  (
    onRefresh: () => refresh_paises_future(),
    child: ListView.builder
    (
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) => Dismissible
      (
        background: _delete_widget( snapshot.data[index] ),
        key: Key( snapshot.data[index].id.toString() ),
        onDismissed: (direction) async
        {
          await snapshot.data[index].delete();

          setState(()
          {
            _paises = Pais.list();
          });

          Fluttertoast.showToast
          (
            msg: "El pais se elimino correctamente.",
            toastLength: Toast.LENGTH_SHORT,
          );
        },
        child: _pais_item_list_widget(context, snapshot, index),
      )
      
    )
  );

  Future<void> refresh_paises_future() async
  {
    await Future.delayed(const Duration(milliseconds: 2009));

    setState(()
    {

    _paises = Pais.list();
    
    });


  }

  Container _delete_widget( pais ) => Container
  (
    color: Colors.red,
    child: ListTile
    (
      trailing: Text("Desea eliminar el pais?", style: TextStyle(color: Colors.white ) ),
      onTap: () => {}
    ),
  );

  

  ListTile _pais_item_list_widget(context, snapshot, index) => ListTile
  (
    trailing: Icon( Icons.arrow_right ),
    title: Text( snapshot.data[index].nombre, ),
    onTap: () => Navigator.of(context).push
    (
      MaterialPageRoute
      (
        builder: (context) => PaisesForm( snapshot.data[index] )
      )
    )
    
  );

  

  

  

}