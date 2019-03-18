import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget 
{
  final String userAccountName = "YourUserName";
  final String userAccountMail = "yourusername@mail.com";

  drawerHeaderItemText(String title) => Text(title, style: TextStyle(color: drawerFontColor(), fontSize: 16.0) );
  drawerListItemText(String title) => Text(title, style: TextStyle(color: drawerFontColor(), fontSize: 20.0, fontWeight: FontWeight.bold ),  );
  drawerIcon(IconData type) => Icon( type, color: drawerFontColor() );
  drawerFontColor() => Colors.white;
  drawerBackgroundColor() => Colors.red;
  drawerDivider() => Divider(color: Colors.white);

  @override
  Widget build(BuildContext context) 
  {

    return Drawer
    (
      child: Container
      (
        color: drawerBackgroundColor(),
        child: ListView
        (
          children: <Widget>
          [            
            UserAccountsDrawerHeader
            (
              accountName: drawerHeaderItemText( userAccountName ),
              accountEmail: drawerHeaderItemText( userAccountMail ),
              currentAccountPicture: GestureDetector
              (
                child: CircleAvatar
                (
                  child: Icon( Icons.verified_user ),
                  backgroundColor: Colors.white,
                )
              ),

            ),
            drawerDivider(),
            ListTile
            (
              title: drawerListItemText("Home"),
              trailing: drawerIcon( Icons.home ),
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            ListTile
            (
              title: drawerListItemText("Albums"),
              trailing: drawerIcon( Icons.album  ),
              onTap: () => Navigator.of(context).pushReplacementNamed('albums'),
            ),
            ListTile
            (
              title: drawerListItemText("Personas"),
              trailing: drawerIcon( Icons.people  ),
              onTap: () => Navigator.of(context).pushReplacementNamed('personas'),
            ),
            ListTile
            (
              title: drawerListItemText("Paises"),
              trailing: drawerIcon( Icons.flag  ),
              onTap: () => Navigator.of(context).pushReplacementNamed('paises'),
            ),
            ListTile
            (
              title: drawerListItemText("Logout"),
              trailing: drawerIcon( Icons.cancel ),
              onTap: () => Navigator.of(context).pop(),
            )
          ]
        )
      )
    );
  }

}