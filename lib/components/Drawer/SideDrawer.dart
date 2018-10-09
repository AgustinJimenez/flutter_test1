import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget 
{
  final String backgroundImagePath = "lib/assets/images/background/bg_one.jpg";
  final String userImagePath = "lib/assets/images/icons/face_18.png";
  final String userAccountName = "YourUserName";
  final String userAccountMail = "yourusername@mail.com";

  @override
  Widget build(BuildContext context) 
  {
    return Drawer
    (
      child: ListView
      (
        children: <Widget>
        [
          UserAccountsDrawerHeader
          (
            accountName: Text( userAccountName ),
            accountEmail: Text( userAccountMail ),
            currentAccountPicture: GestureDetector
            (
              child: CircleAvatar
              (
                backgroundImage: AssetImage( userImagePath ),
              )
            ),
            decoration: BoxDecoration
            (
              image: DecorationImage
              (
                image: AssetImage( backgroundImagePath ),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile
          (
            title: Text("Home"),
            trailing: Icon( Icons.home ),
            onTap: () => 
              Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile
          (
            title: Text("Albums"),
            trailing: Icon( Icons.arrow_right ),
            onTap: () => 
              Navigator.of(context).pushReplacementNamed('albums'),
          ),
          Divider(color: Colors.black),
          ListTile
          (
            title: Text("Logout"),
            trailing: Icon( Icons.cancel ),
            onTap: () => Navigator.of(context).pop(),
          )
        ]
      )
    );
  }
}