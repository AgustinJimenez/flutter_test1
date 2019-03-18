import 'package:flutter/material.dart';

class CardOne extends StatefulWidget 
{
  String _title = "Title";
  CardOne([title])
  {
    if( title != null)
      this._title = title;
  }

  @override
  CardOneState createState() {
    return new CardOneState();
  }
}

class CardOneState extends State<CardOne> {
  _text(title) => Text(title, style: TextStyle(color: Colors.white),);

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      height: 150.0,
      child: Padding
      (
        padding: EdgeInsets.all(8.0),
        child: Card
        (
          color: Colors.red,
          child: Padding
          (
            padding: EdgeInsets.only
            (
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
            ),
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>
              [
                _text( widget._title ),
                Text("HERE", style: Theme.of(context).textTheme.subhead),
                Row
                (
                  children: <Widget>
                  [
                    Icon( Icons.star ),
                    Text(': RATING / 10')
                  ],
                )
              ],
            ),
          ),
        )
      )
    );

  }
}