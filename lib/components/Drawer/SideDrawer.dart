import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget 
{
  final String userAccountName = "YourUserName";
  final String userAccountMail = "yourusername@mail.com";

  drawer_header_item_text(String title) => Text(title, style: TextStyle(color: drawer_font_color(), fontSize: 16.0) );
  drawer_list_item_text(String title) => Text(title, style: TextStyle(color: drawer_font_color(), fontSize: 20.0, fontWeight: FontWeight.bold ),  );
  drawer_icon(IconData type) => Icon( type, color: drawer_font_color() );
  drawer_font_color() => Colors.white;
  drawer_background_color() => Colors.red;
  drawer_divider() => Divider(color: Colors.white);

  @override
  Widget build(BuildContext context) 
  {

    return Drawer
    (
      child: Container
      (
        color: drawer_background_color(),
        child: ListView
        (
          children: <Widget>
          [            
            UserAccountsDrawerHeader
            (
              accountName: drawer_header_item_text( userAccountName ),
              accountEmail: drawer_header_item_text( userAccountMail ),
              currentAccountPicture: GestureDetector
              (
                child: CircleAvatar
                (
                  child: Icon( Icons.verified_user ),
                  backgroundColor: Colors.white,
                )
              ),

            ),
            drawer_divider(),
            ListTile
            (
              title: drawer_list_item_text("Home"),
              trailing: drawer_icon( Icons.home ),
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            ListTile
            (
              title: drawer_list_item_text("Albums"),
              trailing: drawer_icon( Icons.album  ),
              onTap: () => Navigator.of(context).pushReplacementNamed('albums'),
            ),
            ListTile
            (
              title: drawer_list_item_text("Personas"),
              trailing: drawer_icon( Icons.people  ),
              onTap: () => Navigator.of(context).pushReplacementNamed('personas'),
            ),
            ListTile
            (
              title: drawer_list_item_text("Paises"),
              trailing: drawer_icon( Icons.flag  ),
              onTap: () => Navigator.of(context).pushReplacementNamed('paises'),
            ),
            ListTile
            (
              title: drawer_list_item_text("Logout"),
              trailing: drawer_icon( Icons.cancel ),
              onTap: () => Navigator.of(context).pop(),
            )
          ]
        )
      )
    );
  }

}