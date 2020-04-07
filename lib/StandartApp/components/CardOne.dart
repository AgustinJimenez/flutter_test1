import 'package:flutter/material.dart';

class CardOne extends StatefulWidget 
{
  String _title = "[Default title]";
  String _bodyText = "[Default body text]";
  String _bodyFooter = "[Default body text]";

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
  _cardTitle(title) => Text(title, style: TextStyle(color: Colors.white),);
  _cardBodyText(title) => Text(title, style: TextStyle(color: Colors.white));
  _cardBodyFooterText(title) => Text(title, style: TextStyle(color: Colors.white));

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
          color: Theme.of(context).primaryColor,
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
                _cardTitle( widget._title ),
                _cardBodyText( widget._bodyText ),
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