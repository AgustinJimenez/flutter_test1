import 'package:flutter/material.dart';
import '../pages/PBoxProfile/PBoxProfilePage.dart';

CustomAppBar({ BuildContext ctx, leftItem = true, centerItem = true, rightItem = true }) => AppBar(
  leading: null,
  brightness: Brightness.dark,
  automaticallyImplyLeading: false,
  backgroundColor: Theme.of(ctx).colorScheme.secondary,
  actions: [
    Expanded(
      child: _renderLeftItem(ctx, leftItem)
    ),
    Expanded(
      child:_renderCenterItem(ctx, centerItem)
    ),
    Expanded(
      child: _renderRightItem(ctx, rightItem)
    )
  ],
);

_renderLeftItem(ctx, leftItem){

  if( leftItem is bool ) {
    if(leftItem)
      return GestureDetector(
        onPanDown: (DragDownDetails d) =>_showDialog(ctx),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Container( 
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Salir' ,style: TextStyle(color: Colors.white, fontSize: 20))
          ),
        ),
      );
  } else if( leftItem is String )
    return GestureDetector(
      onTap: () => Navigator.pop(ctx),
      child: Container( 
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Icon( Icons.arrow_back, color: Colors.white ) 
            ),
            Text('Atrás' ,style: TextStyle(color: Colors.white, fontSize: 20))
        ])
      )
    );

  return Container();
}

_renderCenterItem(ctx, centerItem){

  if(centerItem is bool){
    if(centerItem)
      return Container(
        child: Image(
          image: AssetImage('assets/images/puntobox.png'),
        ),
      );
  }
  else if(centerItem is String)
    return Container(
      alignment: Alignment.center,
      child: Text(centerItem, style: TextStyle(color: Theme.of(ctx).colorScheme.primary, fontSize: 20), textAlign: TextAlign.center),
    );

  return Container();
}

_renderRightItem(ctx, rightItem){

  if(rightItem is bool)
    if(rightItem)
      return GestureDetector(
        onTap: () => Navigator.of( ctx ).push(
          MaterialPageRoute( builder: (context) => PBoxProfilePage() )
        ),
        child: Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center)
        ),
      );

      return Container();
}


Future<void> _showDialog(ctx) async {
  return showDialog<void>(
    context: ctx,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AVISO'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Esta seguro que desea cerrar sesión?.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            color: Theme.of(ctx).colorScheme.primary,
            child: Text('CANCEL', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            color: Theme.of(ctx).colorScheme.primary,
            child: Text('OK', style: TextStyle(color: Colors.white) ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}







